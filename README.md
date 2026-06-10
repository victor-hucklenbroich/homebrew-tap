# victor-hucklenbroich/tap

Personal Homebrew tap. Currently ships
[DeskController](https://github.com/victor-hucklenbroich/desk-controller),
a macOS menu bar app for controlling Linak-based standing desks.

## Install

```bash
brew install --cask victor-hucklenbroich/tap/desk-controller
```

This taps the repo, installs `DeskController.app` into `/Applications`, and
pulls in the required `linak-controller` CLI automatically.

## Uninstall

```bash
brew uninstall --cask desk-controller          # removes the app
brew uninstall --cask --zap desk-controller    # also removes logs + desk config
brew uninstall linak-controller                # optional: remove the CLI too
```

## Maintenance

The cask is bumped automatically: tagging a release in the
[desk-controller](https://github.com/victor-hucklenbroich/desk-controller) repo
triggers a workflow there that builds, signs, and notarizes the app, uploads it
to a GitHub Release, and pushes the new `version`/`sha256` to this repo. See
`release/BUILD_AND_RELEASE.md` in that repo for details.

The formula tracks upstream [linak-controller](https://github.com/rhyst/linak-controller)
releases on PyPI and is updated manually: bump `url` + `sha256`, then regenerate
the resource stanzas with

```bash
brew update-python-resources victor-hucklenbroich/tap/linak-controller
```
