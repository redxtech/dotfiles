# Post install scripts

# install pacaur
mkdir pacaur-install
cd pacaur-install
# grab cower pkgbuild and install it
curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=cower
makepkg PKGBUILD --skippgpcheck
sudo pacman -U cower*.tar.xz --noconfirm
# remove leftovers
rm PKGBUILD
# grab pacaur pkgbuild and install it
curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=pacaur
makepkg PKGBUILD
sudo pacman -U pacaur*.tar.xz --noconfirm
cd ..
rm pacaur-install


