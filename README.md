# arch-repo
Repository containing the dwm, dmenu and st builds.

## Installation
In order to install the packages provided in this repository add to the file /etc/pacman.conf the following lines:

```
[arch-repo]
SigLevel = Optional DatabaseOptional
Server = https://raw.githubusercontent.com/razvan171514/$repo/master/$arch
```

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
