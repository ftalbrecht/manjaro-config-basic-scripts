# Maintainer: Felix Schindler <aur at felixschindler dot net>

pkgname=manjaro-config-basic-scripts
pkgver=0.1
pkgrel=5
url=https://github.com/ftalbrecht/manjaro-config-basic-scripts
license=('BSD2')
arch=('any')
depends=('bash-completion' 'vimpager' 'ack')
source=('manjaro-config-basic-scripts-create-aur.sh'
        'vimrc'
        'bashrc-aur'
        'LICENSE')
md5sums=('8684657ddf00d4da62d7c992a8de54c7'
         '32f113264d7c73ea2d8a9cfa118dd44e'
         '51e6e7b3cb0fb192ed80e149606d5bfd'
         '61c8f94bc5c95f625d1d22074e4fd0d0')

package() {
  install -D -m755 "${srcdir}/manjaro-config-basic-scripts-create-aur.sh" "${pkgdir}"/usr/bin/manjaro-config-basic-scripts-create-aur
  install -D -m644 "${srcdir}/vimrc" "${pkgdir}"/usr/share/manjaro-config-basic-scripts/vimrc
  install -D -m644 "${srcdir}/bashrc-aur" "${pkgdir}"/usr/share/manjaro-config-basic-scripts/bashrc-aur

  install -D -m644 "${srcdir}/LICENSE" "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

