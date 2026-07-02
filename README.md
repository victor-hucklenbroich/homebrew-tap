# victor-hucklenbroich/tap

Personal [Homebrew](https://brew.sh) tap for my macOS apps and tools.

## Usage

Install any cask directly (this taps the repo automatically):

```bash
brew install --cask victor-hucklenbroich/tap/<name>
```

Or tap once and install as usual:

```bash
brew tap victor-hucklenbroich/tap
brew install --cask <name>
```

Uninstall with `brew uninstall --cask <name>`; add `--zap` to also remove the
app's configuration and logs.

## Available casks

| Cask | Description |
| --- | --- |
| [`desk-controller`](https://github.com/victor-hucklenbroich/desk-controller) | Menu bar app for controlling Linak-based standing desks over Bluetooth |


## Maintenance

Casks are bumped automatically: tagging a release in an app's repository
triggers a workflow there that builds, signs, and notarizes the app, publishes
it as a GitHub Release, and pushes the new `version`/`sha256` to this tap.
CI lints the tap (`brew style` + `brew audit`) on every push, including those
automated bumps.
