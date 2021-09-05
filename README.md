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
1. [dwm-razvan-git](https://github.com/razvan171514/dwm)
2. [dmenu-razvan-git](https://github.com/razvan171514/dmenu)
3. [st-razvan-git](https://github.com/razvan171514/st)

For more information on the packages go to the repository links provided above.

## Packiging guidelines
The name of the repository has to be the same or to be contained in the name of the package specofied in the PKGBUILD file.
The automatic sync scrpit uses the name of the repository in order to locate the package that needs to be updated.

> **Eg:** If the package is named `dmenu-razvan-git` the repository link is: `https://github.com/razvan171514/dmenu.git`

As far as version control goes the folowing functoin should be added to the PKGBUILD file.
```
pkgver() {
	cd name-of-repository
	printf "versoin.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
```
> **Note:** The word 'versoin' in the printf statement should be replaces with a proper base version number.

