# Dotfiles

## Managing

use stow

```
stow --target=$HOME sway
```

## Cloning

Zsh plugins are git submodules, so clone with:

```
git clone --recursive <repo-url>
```

Or, if already cloned:

```
git submodule update --init
```

To update the plugins:

```
git submodule update --remote
```
