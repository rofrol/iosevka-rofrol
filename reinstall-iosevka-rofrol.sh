#!/usr/bin/env bash
# https://stackoverflow.com/questions/59895/how-do-i-get-the-directory-where-a-bash-script-is-located-from-within-the-script/246128#246128
DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
echo ${DIR}
ln -sf ${DIR}/private-build-plans-iosevka-rofrol.toml ${DIR}/vendor/Iosevka/private-build-plans.toml &&
  cd ${DIR}/vendor/Iosevka &&
  npm run build -- ttf-unhinted::iosevka-rofrol &&
  ls ${DIR}/vendor/Iosevka/dist/iosevka-rofrol/TTF-Unhinted/ &&
  ## open ${DIR}/vendor/Iosevka/dist/iosevka-rofrol/TTF-Unhinted/iosevka-rofrol-BookExtended.ttf
  cp ${DIR}/vendor/Iosevka/dist/iosevka-rofrol/TTF-Unhinted/iosevka-rofrol-ExtendedBook.ttf ${DIR}/ &&
  # cp ${DIR}/vendor/Iosevka/dist/iosevka-rofrol/TTF-Unhinted/iosevka-rofrol-ExtendedSemiLight.ttf ${DIR}/
  cd ${DIR}/vendor/FontPatcher &&
  ## seems like this makegroups does not work for `kitty +list-fonts --psnames`
  ## --makegroups needed to have Postscript name https://github.com/ryanoasis/nerd-fonts/issues/579#issuecomment-1441612101
  ## Postscript name may be needed for kitty when disabling ligatures wiht -liga
  ## https://github.com/kovidgoyal/kitty/issues/2738#issuecomment-854384969
  fontforge -script font-patcher --makegroups --complete ${DIR}/vendor/Iosevka/dist/iosevka-rofrol/TTF-Unhinted/iosevka-rofrol-ExtendedBook.ttf &&
  cp IosevkaRofrolNerdFont-Extended.ttf ${DIR}/ &&
  open -a Font\ Book ${DIR}/IosevkaRofrolNerdFont-Extended.ttf
