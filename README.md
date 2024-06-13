# Requirements

Ensure you have the following installed on your system

## Git
### Arch
```
pacman -S git
```

## Stow
### Arch
```
pacman -S stow
```

# Installation

First, check out the dotfiles repo in your $HOME directory using git

```
$ git clone git@github.com/SniperSlayerss/dotfiles.git
$ cd dotfiles
```

then use GNU stow to create symlinks

```
$ stow .
```
