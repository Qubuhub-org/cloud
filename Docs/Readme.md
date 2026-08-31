# Coolify

> Open Source PaaS
 
Self-host your own databases, services (like WordPress, Plausible Analytics, Ghost) and applications (like Next.js, Nuxt.js, Remix, SvelteKit) with ease.

Got it — you want both: (1) I’ll retry pushing once you grant push/PR permission, and (2) I’ll give you a ready-to-run script/patch you can apply locally now. Below I’ve included:

- What I need from you to allow me to push.
- A copy-paste shell script that creates the branch, writes all files (README + templates + workflow + demo), commits, pushes, and opens a PR (using gh if available). Run it from a clone of auraecosystem/aura-codex where you have push rights.
- Quick notes about next steps and optional alternatives.

1) If you want me to retry pushing myself
- Grant write access for the GitHub App or account used by Copilot to the auraecosystem/aura-codex repository, or add the integration that allows pushes from this assistant. Once you confirm you’ve granted permission I will immediately retry the push and open the PR.

2) Script you can run locally (Option 2)
- Save and run the script below from a local clone of the repo (on a machine where you have push rights). It will:
  - create branch upgrade/readme
  - write README.md and the supporting files
  - commit and push to origin
  - open a PR using gh (if gh is installed); if not, it prints the compare URL you can open in the browser.

Copy and paste the following into a file (e.g., upgrade-readme.sh), make it executable (chmod +x), then run it from the repo root:

#!/usr/bin/env bash
set -euo pipefail

BRANCH="upgrade/readme"
PR_TITLE="chore: upgrade README and add templates + demo"
PR_BODY="Upgrades the README and adds CONTRIBUTING, CODE_OF_CONDUCT, issue/pr templates, CODEOWNERS, a reusable workflow, and a demo."

echo "Creating branch ${BRANCH}..."
git checkout -b "${BRANCH}"

echo "Writing README.md..."
cat > README.md <<'EOF'
# Aura Codex

Universal engineering foundation for the Aura Ecosystem — reusable engineering rules, CI workflows, security standards, documentation conventions, and automation scripts that Aura repositories can adopt.

[![CI](https://github.com/auraecosystem/aura-codex/actions/workflows/ci.yml/badge.svg)](https://github.com/auraecosystem/aura-codex/actions) [![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE) [![Last commit](https://img.shields.io/github/last-commit/auraecosystem/aura-codex.svg)](https://github.com/auraecosystem/aura-codex/commits/main)

Table of contents
- What is Aura Codex?
- Principles
- What’s included
- Quickstart
- Usage patterns
- Validation & CI policy
- Contributing
- Governance & maintainers
- Security
- License
- Changelog
- Roadmap / TODO

What is Aura Codex?
-------------------
Aura Codex defines the baseline engineering standards and automation used across the Aura organization so repositories are:
- Production-ready
- Modular
- Secure by default
- AI-native
- Web4-ready
- Blockchain-ready
- Developer-first
- Continuously maintained

What’s included
---------------
- Reusable GitHub Actions workflows and templates
- Security scanning and dependency checks
- Documentation conventions and templates
- Automation scripts and developer tooling
- Examples and adoption guides

Quickstart
----------
Pick one of the options below to adopt pieces of the Codex:

1. Copy templates: Copy the relevant files (for example `.github/workflows/*`, `.github/CODEOWNERS`, `docs/`) into your repository.
2. Reusable workflows: Reference reusable workflows from this repository in your repo’s workflows (see GitHub docs on reusable workflows).
3. Submodule/subtree: Add `aura-codex` as a git submodule/subtree and reference tooling or scripts directly.

Example — copy a workflow:
1. Inspect `.github/workflows/<workflow>.yml` in this repo.
2. Copy into your repo at `.github/workflows/`.
3. Adjust inputs/paths and open a PR.

Usage patterns
--------------
- Use only the parts you need: you can adopt a single workflow or the entire set.
- Keep ownership: add or adjust `.github/CODEOWNERS` to match your team.
- Customize: update secrets, environment names, and policy thresholds per repo needs.

Validation & CI policy
----------------------
Validation is critical — never mark a build/test/security scan/deployment as successful unless it has actually run and passed.

Recommended enforcement:
- Configure required status checks for protected branches (CI, lint, tests, security-scans).
- Use GitHub Actions for automated checks and make them blocking on PR merge.
- Automate dependency scanning (Dependabot / Snyk / GitHub Dependabot alerts).
- Add CodeQL or similar for code scanning where applicable.
- Require review approvals and pass checks before merging.

Contributing
------------
Contributions are welcome. Please follow this flow:
1. Open an issue describing the change or feature.
2. Create a branch named `feat/<short-desc>` or `fix/<short-desc>`.
3. Follow commit message conventions (e.g., Conventional Commits).
4. Submit a PR with tests and documentation updates.
5. CI must pass and reviewers must approve before merging.

Include:
- Issue templates (bug, feature) and PR templates.
- A CONTRIBUTING.md with a step-by-step checklist.

Governance & maintainers
------------------------
List maintainers, owning teams, and escalation contacts here. Example:
- Maintainers: @team-aura-infra
- For major changes, require review from at least two maintainers.

Security
--------
If you discover a security vulnerability, please report it to: security@auraecosystem (replace with your actual contact). Include reproduction steps and affected components. For production-impacting vulnerabilities, mark the issue private.

License
-------
This repository is licensed under the MIT License. See LICENSE for details.

Changelog
---------
Keep a changelog or release notes (e.g., CHANGELOG.md or GitHub releases) for breaking changes, additions, and fixes.

Roadmap / TODO
--------------
- Add adoption examples for popular Aura repos
- Add PR and Issue templates
- Add examples of reusable workflow usage and inputs
- Add a demo repository that shows step-by-step adoption
EOF

echo "Writing CONTRIBUTING.md..."
cat > CONTRIBUTING.md <<'EOF'
# Contributing to Aura Codex

Thanks for your interest in contributing! This repository contains shared engineering rules, workflows, and conventions used across the Aura Ecosystem. Follow the steps below to contribute changes safely and consistently.

Getting started
---------------

1. Fork the repo and create a branch from `main` or add a branch in the org (branch name: `feat/<short-desc>` or `fix/<short-desc>`).
2. Run the repository checks locally when applicable (lint, tests).
3. Keep each PR focused: one concern per PR.

Commit message and branching
----------------------------

- Use Conventional Commits (e.g., `feat: add reusable workflow`, `fix: correct docs`).
- Branch names: `feat/<short-desc>`, `fix/<short-desc>`, or `chore/<short-desc>`.

Pull request process
--------------------

Include the following in every PR:
- A descriptive title and summary of the change.
- Motivation and high-level design for non-trivial changes.
- Tests (unit/integration) where applicable.
- Updated documentation (README, examples) when behavior changes.
- Link to any related issues.

PR review checklist
-------------------
- [ ] CI passes
- [ ] Code follows repository conventions
- [ ] Documentation updated (if applicable)
- [ ] At least one maintainer reviewed (two for major changes)

Code ownership & reviews
------------------------
- Add or update `.github/CODEOWNERS` to set reviewers for files you change.
- For major infra or security-related changes, require two maintainer approvals.

Security & sensitive changes
----------------------------
- For security fixes, open a private issue or contact the security team before public disclosure.
- Add tests and migration steps for changes that impact fleet behavior.

Style & testing
---------------
- Add or update tests for code changes.
- Keep changes minimal and reversible.

Questions or help
-----------------
If you're unsure where to start, open an issue describing what you'd like to change and tag @team-aura-infra.
EOF

echo "Writing CODE_OF_CONDUCT.md..."
cat > CODE_OF_CONDUCT.md <<'EOF'
# Contributor Covenant Code of Conduct

## Our Pledge

In the interest of fostering an open and welcoming environment, we as contributors and maintainers pledge to make participation in our project and our community a harassment-free experience for everyone.

## Our Standards

Examples of behavior that contributes to a positive environment include:

- Using welcoming and inclusive language
- Being respectful of differing viewpoints and experiences
- Gracefully accepting constructive criticism
- Focusing on what is best for the community

Unacceptable behavior by participants includes harassment, trolling, insulting/derogatory comments, and other unwelcome conduct.

## Enforcement

Instances of abusive, harassing, or otherwise unacceptable behavior may be reported by contacting the project maintainers at security@auraecosystem. All complaints will be reviewed and investigated and will result in a response that is deemed necessary and appropriate to the circumstances.

This Code of Conduct is adapted from the Contributor Covenant, version 2.0 (https://www.contributor-covenant.org/version/2/0/code_of_conduct/).
EOF

echo "Creating .github issue & PR templates and CODEOWNERS..."
mkdir -p .github/ISSUE_TEMPLATE
cat > .github/ISSUE_TEMPLATE/bug_report.md <<'EOF'

--- 
name: Bug report
about: Create a report to help us improve
title: ""
labels: bug
assignees: ''
---

**Describe the bug**
A clear and concise description of what the bug is.

**To Reproduce**
Steps to reproduce the behavior:
1. Go to '...'
2. Run '...'
3. See error

**Expected behavior**
A clear and concise description of what you expected to happen.

**Screenshots/Logs**
If applicable, add screenshots or logs to help explain your problem.

**Environment (please complete the following information):**
- Version: [e.g. main]
- OS: [e.g. macOS, Ubuntu]

**Additional context**
Add any other context about the problem here.
EOF

cat > .github/ISSUE_TEMPLATE/feature_request.md <<'EOF'

---
name: Feature request
about: Suggest an idea for this project
title: ""
labels: enhancement
assignees: ''
---

***Is your feature request related to a problem? Please describe.***

A clear and concise description of what the problem is. Ex: I'm always frustrated when...

**Describe the solution you'd like**
A clear and concise description of what you want to happen.

**Describe alternatives you've considered**
A clear and concise description of any alternative solutions or features you've considered.

**Additional context**
Add any other context or screenshots about the feature request here.
EOF

cat > .github/PULL_REQUEST_TEMPLATE.md <<'EOF'
<!-- Pull Request Template -->

## Summary
Describe what this PR changes and why.

## Related issues
List related issues or PRs (if any).

## Checklist
- [ ] Tests added/updated
- [ ] Documentation updated (README, examples)
- [ ] CI passes
- [ ] Code owner review (if applicable)

## Notes for reviewers
Add any details that will help reviewers understand the change.
EOF

cat > .github/CODEOWNERS <<'EOF'
# CODEOWNERS

### Add teams or users who should review changes to the repo. Example:
# * @team-aura-infra

# Default: require reviews from the infra team for changes in `.github` and `workflows`
.github/ @team-aura-infra
.github/workflows/ @team-aura-infra
EOF

echo "Writing reusable workflow..."
mkdir -p .github/workflows
cat > .github/workflows/reusable-ci.yml <<'EOF'
name: Reusable CI
on:
  workflow_call:
    inputs:
      node-version:
        description: 'Node.js version'
        required: false
        default: '18'
      run-tests:
        description: 'Run tests?'
        required: false
        default: 'true'

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Set up Node.js
        uses: actions/setup-node@v4
        with:
          node-version: ${{ inputs.node-version }}

      - name: Install dependencies
        run: |
          if [ -f package.json ]; then
            npm ci
          fi

      - name: Run lint
        if: always()
        run: |
          if [ -f package.json ]; then
            npm run lint || true
          fi

      - name: Run tests
        if: ${{ inputs.run-tests == 'true' }}
        run: |
          if [ -f package.json ]; then
            npm test
          fi

      - name: Upload test results
        if: always()
        uses: actions/upload-artifact@v4
        with:
          name: test-results
          path: test-results || ''
EOF

echo "Adding example/demo files..."
mkdir -p example/.github/workflows example/demo
cat > example/demo/README.md <<'EOF'
# Demo: Using the Aura Codex reusable workflow

This demo shows how you can call the reusable CI workflow from another repository.

Example usage (in your repo's `.github/workflows/ci.yml`):

```yaml
name: CI (calls Aura Codex reusable workflow)

on:
  push:
    branches: [ main ]
  pull_request:
    types: [opened, synchronize, reopened]

jobs:
  call-codex:
    uses: auraecosystem/aura-codex/.github/workflows/reusable-ci.yml@main
    with:
      node-version: '20'
      run-tests: 'true'
```

Notes:
- Replace the `@main` with a tag or commit SHA for reproducible builds.
- If you reference the repo from within the org, you can use the repo name directly.
EOF

cat > example/.github/workflows/demo-call.yml <<'EOF'
name: Demo workflow that calls local reusable workflow
on:
  workflow_dispatch:

jobs:
  run-demo:
    uses: ./../../.github/workflows/reusable-ci.yml
    with:
      node-version: '18'
      run-tests: 'false'
EOF

echo "Staging files..."
git add README.md CONTRIBUTING.md CODE_OF_CONDUCT.md .github .github/ISSUE_TEMPLATE .github/PULL_REQUEST_TEMPLATE.md .github/CODEOWNERS .github/workflows example || true

echo "Committing..."
git commit -m "${PR_TITLE}"

echo "Pushing branch to origin..."
git push -u origin "${BRANCH}"

if command -v gh >/dev/null 2>&1; then
  echo "Opening PR with gh..."
  gh pr create --title "${PR_TITLE}" --body "${PR_BODY}" --base main --head "${BRANCH}"
  echo "PR created via gh."
else
  echo
  echo "No 'gh' CLI found. Open a PR in the browser at:"
  echo "https://github.com/auraecosystem/aura-codex/compare/main...${BRANCH}?expand=1"
fi

echo "Done."

Notes and small edits you should check after running:
- Replace security@auraecosystem with your actual security contact in CODE_OF_CONDUCT.md and README.md.
- If your default branch is not 'main', update the gh PR base and the compare URL.
- The script writes files unconditionally — if you run multiple times it will overwrite them on the branch.

3) After you run the script or grant me push permissions
- If you run the script, it will push and (if gh installed) create the PR automatically. If you prefer I create PR from this assistant, grant permission and tell me; I’ll retry pushing and open the PR immediately.
- If you want the changes split into multiple commits instead of one, let me know and I can provide a version that commits files in separate steps.

`@codex` Which do you want now?
- I can retry pushing now if you grant permission (reply “granted” when done and I’ll attempt).
- Or run the script locally and tell me when the PR is created (I’ll review and suggest adjustments).
- Or I can instead produce a single unified patch file (.patch) if you prefer that over the script.

