# Maintainer: Felix Schindler <aur at felixschindler dot net>

pkgname=manjaro-config-basic-scripts
pkgver=0.1
pkgrel=1
url=https://github.com/ftalbrecht/manjaro-config-basic-scripts
license=('BSD2')
arch=('any')
depends=('gvim' 'bash-completion' 'vimpager' 'ack')
source=("bashrc-aur")
md5sums=('51e6e7b3cb0fb192ed80e149606d5bfd')

package() {
  install -D -m755 "${srcdir}/manjaro-config-basic-scripts-create-aur.sh" "${pkgdir}"/usr/bin/manjaro-config-basic-scripts-create-aur
  install -D -m644 "${srcdir}/bashr-aur" "${pkgdir}"/usr/share/manjaro-config-basic-scripts/bashrc-aur

  install -D -m644 "${srcdir}/LICENSE" "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

