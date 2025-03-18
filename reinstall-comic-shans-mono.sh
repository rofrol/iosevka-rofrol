#!/usr/bin/env bash
# https://stackoverflow.com/questions/59895/how-do-i-get-the-directory-where-a-bash-script-is-located-from-within-the-script/246128#246128
DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
echo ${DIR}
cd ${DIR}/vendor/FontPatcher &&
	# from https://github.com/Rodrigodd/comic-shanns-mono/blob/master/fonts/ComicShannsMono-Regular.ttf
	# https://github.com/Rodrigodd/comic-shanns-mono/pull/2
	fontforge -script font-patcher --complete ${DIR}/ComicShannsMono-Regular.ttf &&
	cp ComicShannsMonoNerdFont-Regular.ttf ${DIR}/ &&
	open -a Font\ Book ${DIR}/ComicShannsMonoNerdFont-Regular.ttf
