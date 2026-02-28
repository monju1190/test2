[![Flatris](flatris.png)](https://flatris.space/)

[![Build Status](https://travis-ci.org/skidding/flatris.svg?branch=master)](https://travis-ci.org/skidding/flatris)

> **Work in progress:** Flatris has been recently redesigned from the ground up and turned into a multiplayer game with both UI and server components. This has been an interesting journey and I plan to document the architecture in depth. **[Stay tuned](https://twitter.com/skidding)**.

[![Flatris](flatris.gif)](https://flatris.space/)

> **Contribution disclaimer:** Flatris is a web game with an opinionated feature set and architectural design. It doesn't have a roadmap. While I'm generally open to ideas, I would advise against submitting unannounced PRs with new or modified functionality. That said, **bug reports and fixes are most appreciated.**

Thanks [@paulgergely](https://twitter.com/paulgergely) for the initial flat design!

Also see [elm-flatris](https://github.com/w0rm/elm-flatris).

## Deployment

This version of Flatris is configured for automated deployment to **AWS App Runner** via **GitHub Actions**.

### Prerequisites
1. **AWS ECR Repository**: Named `flatris`.
2. **IAM User**: With `AmazonEC2ContainerRegistryFullAccess` and `AWSAppRunnerFullAccess`.
3. **GitHub Secrets**:
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`
   - `AWS_APP_RUNNER_ROLE_ARN`: The ARN of the IAM role that App Runner uses to access ECR.

### CI/CD Pipeline
The pipeline is defined in `.github/workflows/deploy.yml`. It automatically:
1. Builds the Docker image.
2. Pushes to Amazon ECR.
3. Deploys/Updates the AWS App Runner service.
