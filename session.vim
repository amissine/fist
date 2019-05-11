let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/project/fist
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +17 .travis.yml
badd +4 before_install.sh
badd +75 .gitignore
badd +1 package.json
badd +35 https-proxy.js
badd +1 Makefile
badd +48 script.sh
badd +1 common.env
badd +1 sp
badd +13 ~/product/integration-tests/local.sh
badd +44 useIssuer.js
badd +1 DOckerfile
badd +3 Dockerfile
badd +50 check_components.sh
badd +20 docker-compose.yml
badd +1 fi1.env
badd +1 fi2.env
badd +1 services/start.sh
badd +99 runTests.js
badd +3 services/Dockerfile
badd +1 services/bridge.cfg
badd +18 services/compliance.cfg
argglobal
silent! argdel *
$argadd .travis.yml
set stal=2
edit package.json
set splitbelow splitright
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
2wincmd k
wincmd w
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=1 winheight=1 winminwidth=1 winwidth=1
exe '1resize ' . ((&lines * 22 + 24) / 48)
exe '2resize ' . ((&lines * 4 + 24) / 48)
exe '3resize ' . ((&lines * 17 + 24) / 48)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 7 - ((6 * winheight(0) + 11) / 22)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
7
normal! 023|
lcd ~/project/fist
wincmd w
argglobal
edit ~/project/fist/before_install.sh
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 2) / 4)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/project/fist
wincmd w
argglobal
edit ~/project/fist/.travis.yml
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 17 - ((16 * winheight(0) + 8) / 17)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
17
normal! 0
wincmd w
exe '1resize ' . ((&lines * 22 + 24) / 48)
exe '2resize ' . ((&lines * 4 + 24) / 48)
exe '3resize ' . ((&lines * 17 + 24) / 48)
tabedit ~/project/fist/common.env
set splitbelow splitright
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
2wincmd k
wincmd w
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=1 winheight=1 winminwidth=1 winwidth=1
exe '1resize ' . ((&lines * 10 + 24) / 48)
exe '2resize ' . ((&lines * 21 + 24) / 48)
exe '3resize ' . ((&lines * 12 + 24) / 48)
argglobal
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
15
normal! zo
let s:l = 1 - ((0 * winheight(0) + 5) / 10)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/project/fist
wincmd w
argglobal
edit ~/project/fist/check_components.sh
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
43
normal! zo
57
normal! zo
let s:l = 43 - ((42 * winheight(0) + 10) / 21)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
43
normal! 0
lcd ~/project/fist
wincmd w
argglobal
edit ~/project/fist/script.sh
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
42
normal! zo
let s:l = 52 - ((16 * winheight(0) + 6) / 12)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
52
normal! 0
lcd ~/project/fist
wincmd w
exe '1resize ' . ((&lines * 10 + 24) / 48)
exe '2resize ' . ((&lines * 21 + 24) / 48)
exe '3resize ' . ((&lines * 12 + 24) / 48)
tabedit ~/project/fist/services/start.sh
set splitbelow splitright
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
4wincmd k
wincmd w
wincmd w
wincmd w
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=1 winheight=1 winminwidth=1 winwidth=1
exe '1resize ' . ((&lines * 6 + 24) / 48)
exe '2resize ' . ((&lines * 5 + 24) / 48)
exe '3resize ' . ((&lines * 2 + 24) / 48)
exe '4resize ' . ((&lines * 2 + 24) / 48)
exe '5resize ' . ((&lines * 26 + 24) / 48)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 3) / 6)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/project/fist
wincmd w
argglobal
edit ~/project/fist/services/Dockerfile
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 3 - ((2 * winheight(0) + 2) / 5)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
3
normal! 0132|
lcd ~/project/fist
wincmd w
argglobal
edit ~/project/fist/fi1.env
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 2 - ((1 * winheight(0) + 1) / 2)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
2
normal! 0
lcd ~/project/fist
wincmd w
argglobal
edit ~/project/fist/fi2.env
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 2 - ((1 * winheight(0) + 1) / 2)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
2
normal! 0
lcd ~/project/fist
wincmd w
argglobal
edit ~/project/fist/docker-compose.yml
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 53 - ((25 * winheight(0) + 13) / 26)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
53
normal! 03|
lcd ~/project/fist
wincmd w
exe '1resize ' . ((&lines * 6 + 24) / 48)
exe '2resize ' . ((&lines * 5 + 24) / 48)
exe '3resize ' . ((&lines * 2 + 24) / 48)
exe '4resize ' . ((&lines * 2 + 24) / 48)
exe '5resize ' . ((&lines * 26 + 24) / 48)
tabedit ~/project/fist/runTests.js
set splitbelow splitright
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
2wincmd k
wincmd w
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=1 winheight=1 winminwidth=1 winwidth=1
exe '1resize ' . ((&lines * 15 + 24) / 48)
exe '2resize ' . ((&lines * 14 + 24) / 48)
exe '3resize ' . ((&lines * 14 + 24) / 48)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 99 - ((13 * winheight(0) + 7) / 15)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
99
normal! 028|
lcd ~/project/fist
wincmd w
argglobal
edit ~/project/fist/services/compliance.cfg
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 18 - ((13 * winheight(0) + 7) / 14)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
18
normal! 0
lcd ~/project/fist
wincmd w
argglobal
edit ~/project/fist/services/bridge.cfg
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 7) / 14)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/project/fist
wincmd w
exe '1resize ' . ((&lines * 15 + 24) / 48)
exe '2resize ' . ((&lines * 14 + 24) / 48)
exe '3resize ' . ((&lines * 14 + 24) / 48)
tabedit ~/project/fist/.gitignore
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=1 winheight=1 winminwidth=1 winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 79 - ((44 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
79
normal! 019|
lcd ~/project/fist
tabnext 5
set stal=1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
set winminheight=1 winminwidth=1
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
