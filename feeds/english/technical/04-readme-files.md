# Writing README Files

**Tags:** #english #technical #documentation #writing  
**Read Time:** ~6 min

> A README is the first thing someone reads about your project. If it doesn't answer their first three questions in 60 seconds, they will give up or waste time figuring it out themselves.

---

## The Three Questions Every README Must Answer

1. **What is this?** — one sentence
2. **How do I run it?** — exact commands, no assumptions
3. **How do I use it?** — the most common workflow

If your README answers these three things clearly, it is already better than most.

---

## Standard Structure

```markdown
# Project Name

One sentence describing what this project does and who it's for.

## Prerequisites
What the reader needs installed before they start.

## Installation
Step-by-step commands to get it running.

## Usage
The most common thing someone will do with this project.

## Configuration
Environment variables, config files, required secrets.

## Development
How to run tests, linters, and the dev server.

## Deployment
How to deploy to staging and production.

## Contributing
How to contribute — branch naming, PR process, coding standards.

## License
```

Not every project needs all sections. A small internal tool might only need the first four.

---

## Writing Each Section

### The Opening Sentence

Be specific. Tell the reader what the project does and why it exists.

| Bad | Good |
|:----|:-----|
| "A web application" | "REST API for managing doctor appointment bookings on the Doctolib platform" |
| "This is our backend" | "Node.js backend serving the mobile app — handles auth, bookings, and payments" |
| "Useful tool" | "CLI tool that generates Jira tickets from a Git branch name" |

### Prerequisites

List the exact versions. "Node.js" is not enough.

```markdown
## Prerequisites

- Node.js 20.x
- PostgreSQL 15
- Docker 24+
- An ABA sandbox account (for payment testing)
```

### Installation

Give exact commands. Never write "install the dependencies" without showing the command.

```markdown
## Installation

\`\`\`bash
git clone https://github.com/org/repo.git
cd repo
cp .env.example .env     # Fill in your values
npm install
npm run db:migrate
npm run dev
\`\`\`

The app runs at http://localhost:3000
```

### Configuration

List every environment variable with a description and an example value.

```markdown
## Configuration

| Variable | Description | Example |
|:---------|:------------|:--------|
| `DATABASE_URL` | PostgreSQL connection string | `postgres://user:pass@localhost:5432/dbname` |
| `JWT_SECRET` | Secret key for signing tokens | `your-secret-here` |
| `ABA_API_KEY` | ABA payment gateway API key | `pk_test_xxxx` |
```

### Development

```markdown
## Development

\`\`\`bash
npm test          # Run unit tests
npm run test:e2e  # Run E2E tests (requires Docker)
npm run lint      # Check code style
npm run build     # Build for production
\`\`\`
```

---

## Language Tips

### Use imperative verbs for commands
- `Run npm install` — not `You should run npm install`
- `Set the DATABASE_URL` — not `The DATABASE_URL needs to be set`
- `Create a .env file` — not `A .env file is needed`

### Use present tense for descriptions
- `This service handles authentication` — not `This service will handle authentication`
- `The API returns a JSON object` — not `The API returned a JSON object`

### Avoid vague words
| Vague | Specific |
|:------|:---------|
| "simple" | (just show the example — let them decide) |
| "easy to use" | (show the 2-line usage example) |
| "powerful" | "handles 10,000 concurrent connections" |
| "modern" | "built with React 18 and TypeScript 5" |
| "etc." | list the actual items |

---

## Common Mistakes

| Mistake | Fix |
|:--------|:----|
| Assumes knowledge ("just configure it") | Write out every step explicitly |
| No example output | Show what success looks like |
| Setup instructions that are out of date | Add a date or link to CI as the source of truth |
| No troubleshooting section | Add the top 3 errors people encounter |
| Wall of text | Use headings, code blocks, and bullet points |

---

## Related

- [Technical Documentation](./05-technical-documentation.md) — deeper documentation beyond the README
- [Code Comments](./03-code-comments.md) — documentation inside the code
