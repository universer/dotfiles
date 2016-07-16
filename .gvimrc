set nomacligatures
set background=dark
set lines=50 columns=200
set guifont=Fira_Code:h15	"字体
set linespace=5				"设置行间距

set guicursor=n:blinkon0            "光标不闪烁

if has("gui_macvim")
    macmenu &File.Print key=<nop>
    macmenu &File.New\ Window key=<nop>
    macmenu &Tools.Make key=<nop>
endif
