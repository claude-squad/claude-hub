#!/bin/bash

# Verify Claude Hub marketplace is properly set up
# Usage: ./scripts/verify-marketplace.sh

echo "Claude Hub Marketplace Verification"
echo "=================================="
echo ""

ERRORS=0
WARNINGS=0

# Check marketplace.json
if [ -f ".claude-plugin/marketplace.json" ]; then
  echo "✓ Marketplace manifest exists"

  if command -v jq &> /dev/null; then
    if jq empty .claude-plugin/marketplace.json 2>/dev/null; then
      echo "✓ Marketplace manifest is valid JSON"

      # Check plugins list
      PLUGIN_COUNT=$(jq '.plugins | length' .claude-plugin/marketplace.json)
      echo "✓ Found $PLUGIN_COUNT plugins in marketplace"
    else
      echo "✗ Marketplace manifest is invalid JSON"
      ((ERRORS++))
    fi
  fi
else
  echo "✗ Marketplace manifest not found"
  ((ERRORS++))
fi

echo ""
echo "Validating Plugins:"
echo "-------------------"

for plugin_dir in plugins/*/; do
  plugin_name=$(basename "$plugin_dir")
  echo ""
  echo "Checking $plugin_name..."

  # Check plugin.json
  if [ -f "$plugin_dir/.claude-plugin/plugin.json" ]; then
    echo "  ✓ plugin.json exists"
  else
    echo "  ✗ plugin.json missing"
    ((ERRORS++))
  fi

  # Check for content
  has_content=false
  if [ -d "$plugin_dir/commands" ] && [ "$(ls -A $plugin_dir/commands 2>/dev/null)" ]; then
    cmd_count=$(ls -1 "$plugin_dir/commands" | wc -l)
    echo "  ✓ $cmd_count command(s)"
    has_content=true
  fi

  if [ -d "$plugin_dir/agents" ] && [ "$(ls -A $plugin_dir/agents 2>/dev/null)" ]; then
    agent_count=$(ls -1 "$plugin_dir/agents" | wc -l)
    echo "  ✓ $agent_count agent(s)"
    has_content=true
  fi

  if [ "$has_content" = false ]; then
    echo "  ⚠ No commands or agents found"
    ((WARNINGS++))
  fi

  # Check README
  if [ -f "$plugin_dir/README.md" ]; then
    echo "  ✓ README.md exists"
  else
    echo "  ⚠ README.md missing"
    ((WARNINGS++))
  fi
done

echo ""
echo "=================================="
echo "Verification Complete!"
echo ""
echo "Summary:"
echo "  Errors: $ERRORS"
echo "  Warnings: $WARNINGS"
echo "  Total Plugins: $(ls -d plugins/*/ 2>/dev/null | wc -l)"

if [ $ERRORS -eq 0 ]; then
  echo ""
  echo "✓ Marketplace is ready to use!"
  echo ""
  echo "To use the marketplace:"
  echo "  1. Configure Claude Code to use this marketplace"
  echo "  2. Run: /plugin"
  echo "  3. Browse and install plugins"
  exit 0
else
  echo ""
  echo "✗ Please fix errors before using the marketplace"
  exit 1
fi
