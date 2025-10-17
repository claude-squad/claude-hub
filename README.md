# Claude Hub - Claude Code Plugin Marketplace

A comprehensive marketplace of Claude Code plugins for software development workflows. This monorepo contains high-quality plugins for Rails, React/TypeScript, code review, UI/UX design, and more.

## Overview

Claude Hub provides a curated collection of Claude Code plugins that follow best practices and enhance developer productivity. Each plugin is designed to work seamlessly with Claude Code CLI and can be easily installed into your projects.

## Available Plugins

### Workflow Plugins

#### Rails Workflow (`rails-workflow`)
Complete workflow automation for Ruby on Rails development.

**Features:**
- Model generation with validations
- Controller scaffolding with RESTful actions
- Turbo Stream support
- Service object patterns
- RSpec setup and configuration
- API endpoint generation

**Commands:** 6 slash commands
**Installation:** `./scripts/install-plugin.sh rails-workflow /path/to/rails/project`

---

#### React TypeScript Workflow (`react-typescript-workflow`)
Modern React and TypeScript development workflows.

**Features:**
- Component generation with TypeScript
- Custom hooks creation
- Context/state management setup
- React Testing Library configuration
- Form handling with React Hook Form + Zod
- Data fetching with React Query

**Commands:** 6 slash commands
**Installation:** `./scripts/install-plugin.sh react-typescript-workflow /path/to/react/project`

---

### Code Review Agents

#### Rails Code Review Agent (`rails-code-review-agent`)
Specialized agent for reviewing Rails code with expertise in conventions and best practices.

**Features:**
- Rails convention enforcement
- Model validation review
- Controller best practices
- Security vulnerability detection
- N+1 query identification
- Performance optimization suggestions

**Agents:** 1 specialized agent
**Installation:** `./scripts/install-plugin.sh rails-code-review-agent /path/to/rails/project`

---

#### React TypeScript Code Review Agent (`react-typescript-code-review-agent`)
Expert code review for React and TypeScript applications.

**Features:**
- Modern React pattern enforcement
- TypeScript strict type checking
- Hook usage validation
- Performance optimization
- Accessibility compliance
- Testing best practices

**Agents:** 1 specialized agent
**Installation:** `./scripts/install-plugin.sh react-typescript-code-review-agent /path/to/react/project`

---

### Design Agents

#### UI/UX Design Agent (`ui-ux-design-agent`)
Iterative UI/UX design and refinement specialist.

**Features:**
- Component layout design
- Responsive design implementation
- Accessibility compliance
- Visual hierarchy optimization
- Iterative feedback loops
- Design system adherence

**Agents:** 1 specialized agent
**Installation:** `./scripts/install-plugin.sh ui-ux-design-agent /path/to/project`

---

## Quick Start

### Installation

1. Clone this repository:
```bash
git clone https://github.com/yourusername/claude-hub.git
cd claude-hub
```

2. Configure the Claude Hub marketplace in Claude Code (see Marketplace Setup below)

3. List available plugins:
```bash
./scripts/list-plugins.sh
```

4. Install plugins via Claude Code:
```bash
# In Claude Code, run:
/plugin

# Or install directly:
/plugin install rails-workflow@claude-hub
```

### Marketplace Setup

To use the Claude Hub plugin marketplace with Claude Code:

1. In Claude Code, configure the Claude Hub marketplace by pointing to this repository
2. The marketplace configuration is in `.claude-plugin/marketplace.json`
3. Once configured, you can browse and install plugins using `/plugin`

### Example: Installing Rails Workflow Plugin

```bash
# In your Rails project, open Claude Code
cd ~/projects/my-rails-app
claude

# Install the Rails workflow plugin
/plugin install rails-workflow@claude-hub

# Use the commands
/rails-generate-model User name:string email:string
```

## Plugin Structure

Each plugin follows the official Claude Code plugin structure:

```
plugin-name/
├── .claude-plugin/
│   └── plugin.json        # Plugin manifest (required)
├── commands/              # Slash commands (*.md files)
├── agents/                # AI agents (*.md files)
├── skills/                # Agent skills (optional)
├── hooks/                 # Event hooks (optional)
├── package.json           # npm metadata
├── README.md              # Plugin documentation
└── examples/              # Usage examples
```

### plugin.json Manifest

Every plugin must have a `.claude-plugin/plugin.json` manifest:

```json
{
  "name": "plugin-name",
  "description": "Plugin description",
  "version": "1.0.0",
  "author": {
    "name": "Author Name"
  },
  "keywords": ["keyword1", "keyword2"],
  "categories": ["category1"]
}
```

## Development

### Creating a New Plugin

1. Create plugin directory:
```bash
mkdir -p plugins/my-plugin/.claude/{commands,agents}
```

2. Add package.json:
```json
{
  "name": "@claude-hub/my-plugin",
  "version": "0.1.0",
  "description": "My awesome plugin",
  "keywords": ["claude-code", "plugin"]
}
```

3. Add commands or agents as markdown files

4. Create README.md with usage instructions

5. Validate your plugin:
```bash
./scripts/validate-plugin.sh my-plugin
```

### Plugin Development Guidelines

See [docs/best-practices/PLUGIN_GUIDELINES.md](docs/best-practices/PLUGIN_GUIDELINES.md) for comprehensive guidelines on:
- Command development
- Agent creation
- Best practices
- Testing
- Documentation

## Utilities

### List All Plugins
```bash
./scripts/list-plugins.sh
```

### Install a Plugin
```bash
./scripts/install-plugin.sh <plugin-name> <target-directory>
```

### Validate a Plugin
```bash
./scripts/validate-plugin.sh <plugin-name>
```

## Plugin Categories

### 1. Workflow Automation
Plugins that automate common development tasks through slash commands.

**Examples:** rails-workflow, react-typescript-workflow

### 2. Code Review Agents
Specialized AI agents that review code for quality, conventions, and best practices.

**Examples:** rails-code-review-agent, react-typescript-code-review-agent

### 3. Framework Integrations
Framework-specific tools and conventions.

**Examples:** Rails plugins, React plugins

### 4. Design & UX
Plugins focused on UI/UX design and iterative refinement.

**Examples:** ui-ux-design-agent

### 5. Developer Utilities
General-purpose development tools and helpers.

## Best Practices

All plugins in this marketplace follow these principles:

1. **Clear Documentation**: Every plugin has comprehensive README
2. **Examples Included**: Real-world usage examples
3. **Best Practices**: Follow framework and language conventions
4. **Type Safety**: TypeScript where applicable
5. **Testing**: Encourage test coverage
6. **Accessibility**: WCAG compliance in UI plugins
7. **Performance**: Optimization considerations
8. **Security**: Security best practices enforced

## Contributing

We welcome contributions! To contribute:

1. Fork this repository
2. Create a new plugin or improve existing ones
3. Follow the plugin development guidelines
4. Validate your plugin with `./scripts/validate-plugin.sh`
5. Submit a pull request

### Contribution Guidelines

- Follow existing plugin patterns
- Include comprehensive documentation
- Provide usage examples
- Test your plugin thoroughly
- Update this README with plugin details

## Requirements

- Claude Code CLI
- Node.js 18+ (for monorepo tooling)
- Git
- Bash (for utility scripts)

## Project Structure

```
claude-hub/
├── plugins/                    # All plugins
│   ├── rails-workflow/
│   ├── react-typescript-workflow/
│   ├── rails-code-review-agent/
│   ├── react-typescript-code-review-agent/
│   └── ui-ux-design-agent/
├── shared/                     # Shared utilities
│   ├── types/                  # TypeScript types
│   └── utils/                  # Helper functions
├── docs/                       # Documentation
│   └── best-practices/         # Plugin guidelines
├── scripts/                    # Utility scripts
│   ├── install-plugin.sh
│   ├── validate-plugin.sh
│   └── list-plugins.sh
├── package.json                # Monorepo configuration
├── tsconfig.json               # TypeScript config
└── README.md                   # This file
```

## Roadmap

Future plugins planned:

- [ ] Python/FastAPI workflow plugin
- [ ] Go development plugin
- [ ] Database migration helper
- [ ] API documentation generator
- [ ] Performance testing agent
- [ ] Security audit agent
- [ ] Docker/deployment utilities
- [ ] GraphQL schema builder

## Support

### Documentation

- [Plugin Guidelines](docs/best-practices/PLUGIN_GUIDELINES.md)
- Individual plugin READMEs in each plugin directory

### Getting Help

- GitHub Issues: [Report an issue](https://github.com/yourusername/claude-hub/issues)
- Discussions: [Community discussions](https://github.com/yourusername/claude-hub/discussions)

## License

MIT License - see [LICENSE](LICENSE) file

## Credits

Built for the Claude Code community by developers who love automation and great developer experiences.

## Version

0.1.0 - Initial release

## Changelog

See individual plugin READMEs for plugin-specific changes.

### v0.1.0 (Initial Release)

- Rails Workflow plugin with 6 commands
- React TypeScript Workflow plugin with 6 commands
- Rails Code Review agent
- React TypeScript Code Review agent
- UI/UX Design agent
- Utility scripts for plugin management
- Comprehensive documentation

## Acknowledgments

Thanks to:
- Anthropic for Claude Code
- The Rails community for Rails conventions
- The React community for React patterns
- All contributors and users

---

**Start building better software with Claude Hub plugins!**

Get started: `./scripts/list-plugins.sh`
