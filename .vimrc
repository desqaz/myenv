if $GVIM_PATH == ""
   :let $GVIM_PATH  = "$HOME/myenv/gvim"
endif

:let $VIMRUNTIME = $GVIM_PATH
source $GVIM_PATH/vimrc
