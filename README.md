# deployah-dev/tap

Homebrew tap for [deployah](https://github.com/deployah-dev/deployah) — a CLI tool that makes
deploying applications to Kubernetes effortless, without requiring Helm or Kubernetes expertise.

## Install

```sh
brew install deployah-dev/tap/deployah
```

## Upgrade

```sh
brew upgrade deployah-dev/tap/deployah
```

## Uninstall

```sh
brew uninstall deployah-dev/tap/deployah
```

## How it works

When a new release is published in the main repository, a GitHub Actions workflow triggers the
`update-formula` workflow in this tap via `workflow_dispatch`. That workflow downloads the
`SHA256SUMS` file from the release, renders `Formula/deployah.rb` from the template in
`templates/deployah.rb.tmpl`, and pushes the updated formula directly to `main`. A separate
`validate` workflow then runs `brew audit`, `brew style`, `brew install`, and `brew test` to
confirm the formula is correct.

To trigger a formula update manually, go to Actions > Update Formula > Run workflow and enter
the version number (without the `v` prefix, e.g. `0.1.4`).

## License

Apache-2.0 — see [LICENSE](LICENSE).
