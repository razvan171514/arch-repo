# arch-repo
Repository containing the dwm, dmenu and st builds.

## Installation
In order to install the packages provided in this repository add to the file /etc/pacman.conf the following lines:

```
[arch-repo]
SigLevel = Optional DatabaseOptional
Server = https://github.com/razvan171514/$repo/raw/master/$arch
```

> **Note:** If you add this repository to a bare arch installation use ```SigLevel = Never```

After adding the lines to the pacman.conf you have to syncronize the repositories using:

```
$ sudo pacman -Syyu
```
And then:

```
$ sudo pacman -S name-of-package
```

## Packages
1. dwm-razvan-git
2. dmenu-razvan-git
3. st-razvan-git
