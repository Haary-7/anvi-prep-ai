# Contributing to Anvi Prep AI

Thank you for your interest in contributing to Anvi Prep AI! This document provides guidelines and instructions for contributing.

## Code of Conduct

We are committed to providing a welcoming and inspiring community for all. Please follow our [Code of Conduct](CODE_OF_CONDUCT.md).

## Getting Started

1. **Fork the Repository**
   ```bash
   git clone https://github.com/Haary-7/anvi-prep-ai.git
   cd anvi-prep-ai
   ```

2. **Create a Feature Branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Follow the Development Setup**
   See [Local Development Setup](README.md#local-development-setup) in README.md

## Development Guidelines

### Commit Message Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation
- `style`: Code style changes
- `refactor`: Code refactoring
- `test`: Adding/updating tests
- `chore`: Build, dependencies, tooling
- `perf`: Performance improvements

**Example:**
```
feat(quiz): add timer functionality to quiz taker

This implements a countdown timer for quiz sessions with visual
indicators showing remaining time. Users can pause and resume the timer.

Fixes #123
```

### Branch Naming

```
feature/descriptive-name       # New features
bugfix/descriptive-name        # Bug fixes
hotfix/critical-issue          # Critical production fixes
refactor/component-name        # Code refactoring
docs/what-you-documented       # Documentation
test/what-you-tested           # Test additions
```

## Testing Requirements

Before submitting a PR:

- **Frontend**: Run `npm run test` - ensure tests pass
- **Backend**: Run `pytest` - ensure tests pass
- **Lint**: Run `npm run lint` and check Python linting
- **Build**: Verify `npm run build` succeeds

```bash
# Test everything
npm run test
pytest
npm run lint
npm run build
```

## Code Quality Standards

Please follow the [Engineering Standards](ENGINEERING_STANDARDS.md) document:

- **TypeScript**: Strict mode, no `any` types
- **Python**: Type hints, proper docstrings
- **Naming**: Follow conventions (camelCase, snake_case)
- **Comments**: Explain "why", not "what"
- **Functions**: Keep small and focused
- **Error handling**: Use custom exceptions
- **Security**: No hardcoded secrets

## Pull Request Process

1. **Update Documentation**
   - Update README.md if you added features
   - Update API docs if you modified endpoints
   - Add/update code comments

2. **Write Tests**
   - Unit tests for new functions/methods
   - Integration tests for workflows
   - E2E tests for user flows

3. **Self-Review**
   - Check for obvious errors
   - Verify code follows standards
   - Ensure tests pass locally

4. **Create PR**
   ```bash
   git push origin feature/your-feature-name
   ```
   
   - Write clear PR description
   - Reference related issues
   - Link screenshots for UI changes

5. **Respond to Feedback**
   - Address all review comments
   - Update PR with new commits
   - Re-request review when ready

## Code Review Checklist

Reviewers will check:

- ✅ Code follows style guide
- ✅ Includes appropriate tests
- ✅ Documentation is updated
- ✅ No hardcoded secrets
- ✅ Performance considered
- ✅ Error handling implemented
- ✅ Accessibility verified (frontend)
- ✅ Security implications reviewed

## Architecture Guidelines

### Frontend (Next.js)

- Use App Router (not Pages Router)
- Component-based structure
- TypeScript for type safety
- TanStack Query for async state
- shadcn/ui for components
- Tailwind CSS for styling

### Backend (FastAPI)

- RESTful API design
- Service layer for business logic
- SQLAlchemy ORM for database
- Pydantic for validation
- Proper error handling
- Comprehensive logging

### AI Services

- Modular LLM interactions
- RAG pipeline for context
- Vector embeddings for search
- Separate service for scaling

## Performance Considerations

- Frontend bundle size < 200KB (gzipped)
- API response time p95 < 200ms
- Database query p95 < 50ms
- No N+1 queries
- Proper caching strategy

## Security Checklist

- ✅ Input validation and sanitization
- ✅ SQL injection prevention (use ORM)
- ✅ No secrets in code
- ✅ Proper authentication/authorization
- ✅ Rate limiting on APIs
- ✅ HTTPS/TLS in production
- ✅ Environment variables for config

## Running Locally

```bash
# Start all services
docker-compose up -d

# Or manually
npm run dev                  # Terminal 1: Frontend
cd apps/api && python -m uvicorn app.main:app --reload  # Terminal 2: Backend
cd services/ai_engine && python -m uvicorn main:app --reload --port 8001  # Terminal 3: AI
```

## Deployment

- **Staging**: Merged to `develop` branch
- **Production**: Merged to `main` branch

Deployments are automatic via GitHub Actions.

## Need Help?

- **Documentation**: Check [docs/](docs/) folder
- **Issues**: Open a [GitHub Issue](https://github.com/Haary-7/anvi-prep-ai/issues)
- **Discussions**: Join [GitHub Discussions](https://github.com/Haary-7/anvi-prep-ai/discussions)

## Recognition

Contributors will be recognized in:
- README.md contributors section
- GitHub contributors page
- Release notes

Thank you for contributing! 🎉
