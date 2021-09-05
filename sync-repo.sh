#!/bin/sh

declare -a repos=(
    'https://github.com/razvan171514/dmenu.git'
    'https://github.com/razvan171514/dwm.git'
    'https://github.com/razvan171514/st.git'
)

if [[ -d ./sync ]]; then
    echo "Needed directory ./sync already exists!"
    read -p 'Do you want to continue by removing the directory? [y/n] ' go_on
    if [[ $go_on == 'n' || $go_on == 'N' ]]; then
	echo 'Exiting...'
	exit 1
    else rm -r ./sync
    fi
fi

mkdir ./sync
cd ./sync

for repo in "${repos[@]}"
do
    git clone "$repo"
    cd "./$(printf "%s" "$repo" | awk -F '/' '{print $NF}' | awk -F '.' '{print $1}')"
    echo "$(pwd)"
    rev="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
    repo_name=$(printf "%s" "$repo" | awk -F '/' '{print $NF}' | awk -F '.' '{print $1}') 
    if [[ "$repo_name" == "st" ]]; then
	pkg_rev=$(ls ../../x86_64 | grep "$repo_name-" | awk -F '-' '{print $(NF-2)}' | awk -F 'r' '{print $NF}')
    else pkg_rev=$(ls ../../x86_64 | grep "$repo_name" | awk -F '-' '{print $(NF-2)}' | awk -F 'r' '{print $NF}')
    fi
    echo "$(pwd) |-------->  ${rev} <+++> $pkg_rev"
    if [[ "$rev" != "$pkg_rev" ]]; then
	mkdir "../${repo_name}-pkg"
	cp PKGBUILD "../${repo_name}-pkg"
	cd "../${repo_name}-pkg"
	sed -i '/pkgver=/c\pkgver=0' PKGBUILD
	makepkg -cf
	rm "../../x86_64/$(ls "../../x86_64/" | grep "$(printf "%s" "$repo_name")-")"
	cp *.pkg.tar.zst ../../x86_64
    else echo "NOTHING TO DO..."
    fi
    cd ..
done

cd ..
sudo rm -r ./sync
echo "Synced"
