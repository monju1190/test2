[![Flatris](flatris.png)](https://flatris.space/)

[![Build Status](https://travis-ci.org/skidding/flatris.svg?branch=master)](https://travis-ci.org/skidding/flatris)

> **Work in progress:** Flatris has been recently redesigned from the ground up and turned into a multiplayer game with both UI and server components. This has been an interesting journey and I plan to document the architecture in depth. **[Stay tuned](https://twitter.com/skidding)**.

[![Flatris](flatris.gif)](https://flatris.space/)

> **Contribution disclaimer:** Flatris is a web game with an opinionated feature set and architectural design. It doesn't have a roadmap. While I'm generally open to ideas, I would advise against submitting unannounced PRs with new or modified functionality. That said, **bug reports and fixes are most appreciated.**

Thanks [@paulgergely](https://twitter.com/paulgergely) for the initial flat design!

Also see [elm-flatris](https://github.com/w0rm/elm-flatris).

## Deployment

This project is containerized with **Docker** and configured for automated deployment to **Render.com**.

### CI/CD Pipeline
1. **CI (GitHub Actions)**: A build verification workflow ([ci.yml](.github/workflows/ci.yml)) runs on every push to ensure the code compiles successfully.
2. **CD (Render)**: Render automatically detects changes in the `master` branch and initiates a zero-downtime deployment using the project's `Dockerfile`.

### Architectural Highlights
- **Environment Agnostic**: The application uses dynamic port binding through `process.env.PORT`, making it compatible with any cloud provider (AWS, GCP, Render).
- **Legacy Stability**: Using a single-stage Docker build ensures all Node 10 and Babel dependencies are correctly bundled for production.
