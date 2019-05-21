# Pre install scripts for arch

echo Running arch pre-install scripts...

cd $HOME

# install pacaur
mkdir $HOME/pacaur-install
cd $HOME/pacaur-install

# install dependencies
mkdir $HOME/pacaur-install/auracle
cd $HOME/pacaur-install/auracle
curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=auracle-git
makepkg PKGBUILD
sudo pacman -U auracle*.tar.xz --noconfirm
cd $HOME/pacaur-install
rm -r $HOME/pacaur-install/auracle

# grab pacaur pkgbuild and install it
curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=pacaur
makepkg PKGBUILD
sudo pacman -U pacaur*.tar.xz --noconfirm
cd $HOME
rm -r $HOME/pacaur-install

echo Finished arch pre-install scripts. 

