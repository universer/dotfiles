set nomacligatures
set background=dark

set guicursor=n:blinkon0            "��겻��˸

if has("gui_macvim")
    macmenu &File.Print key=<nop>
    macmenu &File.New\ Window key=<nop>
    macmenu &Tools.Make key=<nop>
endif
