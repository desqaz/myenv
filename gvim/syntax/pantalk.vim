" Vim syntax file
" Language:	PanTalk
" Maintainer:	Pain Didier <dpain@canal-plus.fr>
" Last change:	1999 Sept 10

" Remove any old syntax stuff hanging around
syn clear

" A bunch of useful PanTalk keywords

" Note: Pantalk is an ignore case language. To highlight keywords, as function names,
"       the syntax definition has to match with lower an upper case of all its letters
"       because there is no way to set an ignore case option when matching syntax.
"       Example: to highlight the word "SOIF", or "SoIf", or "sOIF", etc., vim has to
"                match with the sentence "\<[sS][oO][iI][fF]\>".
"       But we could set 'syn case ignore' before and 'syn case match' after in order
"       to ignore case and then match with sensitive cases.


" Match words with insensitive  cases
syn case ignore

syn keyword      pantalkStatement        return stop

syn keyword      pantalkLabel            on off script run_script run_scripts background_script

syn keyword      pantalkConditional      if else then endif

syn keyword      pantalkRepeat           while done for to step next repeat until

syn match        pantalkOperator         ":and:\|:or:\|:band:\|:bor:\|:bsl:\|:bsr:\|:bxor:"

syn keyword      pantalkFunction         abs
syn keyword      pantalkFunction         acos
syn keyword      pantalkFunction         ascii
syn keyword      pantalkFunction         asin
syn keyword      pantalkFunction         atn
syn keyword      pantalkFunction         chr
syn keyword      pantalkFunction         concat
syn keyword      pantalkFunction         cos
syn keyword      pantalkFunction         exp
syn keyword      pantalkFunction         fra
syn keyword      pantalkFunction         left
syn keyword      pantalkFunction         len
syn keyword      pantalkFunction         log
syn keyword      pantalkFunction         log10
syn keyword      pantalkFunction         max
syn keyword      pantalkFunction         mid
syn keyword      pantalkFunction         min
syn keyword      pantalkFunction         right
syn keyword      pantalkFunction         round
syn keyword      pantalkFunction         sgn
syn keyword      pantalkFunction         sin
syn keyword      pantalkFunction         sqr
syn keyword      pantalkFunction         str
syn keyword      pantalkFunction         tan
syn keyword      pantalkFunction         val
syn keyword      pantalkFunction         hstr
syn keyword      pantalkFunction         hval
syn keyword      pantalkFunction         int
syn keyword      pantalkFunction         peek
syn keyword      pantalkFunction         peekb
syn keyword      pantalkFunction         peeki
syn keyword      pantalkFunction         peeks
syn keyword      pantalkFunction         poke
syn keyword      pantalkFunction         pokeb
syn keyword      pantalkFunction         pokei
syn keyword      pantalkFunction         pokes
syn keyword      pantalkFunction         random
syn keyword      pantalkFunction         real
syn keyword      pantalkFunction         random
syn keyword      pantalkFunction         real

syn keyword      pantalkFunction         abort_module
syn keyword      pantalkFunction         add_string
syn keyword      pantalkFunction         adr2int
syn keyword      pantalkFunction         aut_public
syn keyword      pantalkFunction         auto_vdx
syn keyword      pantalkFunction         backup_file
syn keyword      pantalkFunction         backup_file_address
syn keyword      pantalkFunction         backup_module
syn keyword      pantalkFunction         backup_text
syn keyword      pantalkFunction         bezier2poly
syn keyword      pantalkFunction         bkg_ird_mount
syn keyword      pantalkFunction         bkg_ird_rcv_module
syn keyword      pantalkFunction         build_proc_table
syn keyword      pantalkFunction         bus_base
syn keyword      pantalkFunction         bus_read
syn keyword      pantalkFunction         bus_write
syn keyword      pantalkFunction         change_panel_focus
syn keyword      pantalkFunction         change_po_code
syn keyword      pantalkFunction         change_po_var
syn keyword      pantalkFunction         clear_event
syn keyword      pantalkFunction         clear_flash
syn keyword      pantalkFunction         clear_po
syn keyword      pantalkFunction         clear_to
syn keyword      pantalkFunction         close_df
syn keyword      pantalkFunction         cnx_vdx
syn keyword      pantalkFunction         cold_start_info
syn keyword      pantalkFunction         compact_string
syn keyword      pantalkFunction         compact_structure
syn keyword      pantalkFunction         compare_object
syn keyword      pantalkFunction         convert6to8
syn keyword      pantalkFunction         convert8to6
syn keyword      pantalkFunction         copya2mem
syn keyword      pantalkFunction         copyi2mem
syn keyword      pantalkFunction         copymem
syn keyword      pantalkFunction         copymem2a
syn keyword      pantalkFunction         copymem2i
syn keyword      pantalkFunction         copymem2text
syn keyword      pantalkFunction         copymem2val
syn keyword      pantalkFunction         copymem2var
syn keyword      pantalkFunction         copytext2mem
syn keyword      pantalkFunction         copyval2mem
syn keyword      pantalkFunction         copyvar2mem
syn keyword      pantalkFunction         copy_byte
syn keyword      pantalkFunction         copy_df
syn keyword      pantalkFunction         copy_object
syn keyword      pantalkFunction         cre_display
syn keyword      pantalkFunction         create_panel
syn keyword      pantalkFunction         create_po
syn keyword      pantalkFunction         create_window
syn keyword      pantalkFunction         data_match
syn keyword      pantalkFunction         date_sys
syn keyword      pantalkFunction         date_to_integer
syn keyword      pantalkFunction         del_icofile
syn keyword      pantalkFunction         del_window
syn keyword      pantalkFunction         delete_line
syn keyword      pantalkFunction         delete_panel
syn keyword      pantalkFunction         delete_po
syn keyword      pantalkFunction         dev_call
syn keyword      pantalkFunction         dev_call2
syn keyword      pantalkFunction         dev_io
syn keyword      pantalkFunction         dev_io2
syn keyword      pantalkFunction         device_alloc_buffer
syn keyword      pantalkFunction         device_call
syn keyword      pantalkFunction         device_close_channel
syn keyword      pantalkFunction         device_close_device
syn keyword      pantalkFunction         device_event
syn keyword      pantalkFunction         device_free_buffer
syn keyword      pantalkFunction         device_io
syn keyword      pantalkFunction         device_info
syn keyword      pantalkFunction         device_info_alloc_buffer
syn keyword      pantalkFunction         device_info_free_buffer
syn keyword      pantalkFunction         device_lock_buffer
syn keyword      pantalkFunction         device_open_channel
syn keyword      pantalkFunction         device_open_device
syn keyword      pantalkFunction         display_po_var
syn keyword      pantalkFunction         display_str2display
syn keyword      pantalkFunction         draw_icone
syn keyword      pantalkFunction         draw_image
syn keyword      pantalkFunction         draw_po
syn keyword      pantalkFunction         draw_po_background
syn keyword      pantalkFunction         draw_po_border
syn keyword      pantalkFunction         draw_po_inside
syn keyword      pantalkFunction         dupmem
syn keyword      pantalkFunction         dup_panel_selnum
syn keyword      pantalkFunction         empty_object
syn keyword      pantalkFunction         evchar_vdx
syn keyword      pantalkFunction         expand_structure
syn keyword      pantalkFunction         extract_line
syn keyword      pantalkFunction         extract_word
syn keyword      pantalkFunction         fifo_in
syn keyword      pantalkFunction         fifo_init
syn keyword      pantalkFunction         fifo_out
syn keyword      pantalkFunction         fifo_peek
syn keyword      pantalkFunction         fin_vdx
syn keyword      pantalkFunction         flash_delete
syn keyword      pantalkFunction         free_display
syn keyword      pantalkFunction         free_ram
syn keyword      pantalkFunction         free_sem
syn keyword      pantalkFunction         getticktime
syn keyword      pantalkFunction         get_buffer_outline
syn keyword      pantalkFunction         get_buffer_size
syn keyword      pantalkFunction         get_debug_line
syn keyword      pantalkFunction         get_debug_list
syn keyword      pantalkFunction         get_descriptor_list
syn keyword      pantalkFunction         get_df
syn keyword      pantalkFunction         get_display_coord
syn keyword      pantalkFunction         get_eeprom
syn keyword      pantalkFunction         get_file_address
syn keyword      pantalkFunction         get_header
syn keyword      pantalkFunction         get_key_validity
syn keyword      pantalkFunction         get_line_number
syn keyword      pantalkFunction         get_lut_code
syn keyword      pantalkFunction         get_mematt
syn keyword      pantalkFunction         get_module_file_list
syn keyword      pantalkFunction         get_module_id
syn keyword      pantalkFunction         get_module_list
syn keyword      pantalkFunction         get_module_name
syn keyword      pantalkFunction         get_module_orig
syn keyword      pantalkFunction         get_object_buffer
syn keyword      pantalkFunction         get_on_event_info
syn keyword      pantalkFunction         get_pat_section
syn keyword      pantalkFunction         get_panel_event_type
syn keyword      pantalkFunction         get_panel_id
syn keyword      pantalkFunction         get_panel_keycode
syn keyword      pantalkFunction         get_panel_page
syn keyword      pantalkFunction         get_panel_sel
syn keyword      pantalkFunction         get_panel_selnum
syn keyword      pantalkFunction         get_panel_value
syn keyword      pantalkFunction         get_pg_sel
syn keyword      pantalkFunction         get_po_att
syn keyword      pantalkFunction         get_po_enum
syn keyword      pantalkFunction         get_po_focus
syn keyword      pantalkFunction         get_po_font
syn keyword      pantalkFunction         get_po_icone
syn keyword      pantalkFunction         get_po_icone2
syn keyword      pantalkFunction         get_po_image
syn keyword      pantalkFunction         get_po_link
syn keyword      pantalkFunction         get_po_numtext
syn keyword      pantalkFunction         get_po_pos
syn keyword      pantalkFunction         get_po_realtext
syn keyword      pantalkFunction         get_po_size
syn keyword      pantalkFunction         get_po_state
syn keyword      pantalkFunction         get_po_text
syn keyword      pantalkFunction         get_po_type
syn keyword      pantalkFunction         get_po_var
syn keyword      pantalkFunction         get_po_viewline
syn keyword      pantalkFunction         get_po_winnum
syn keyword      pantalkFunction         get_spanel_page
syn keyword      pantalkFunction         get_var_kind
syn keyword      pantalkFunction         get_var_type
syn keyword      pantalkFunction         get_window_position
syn keyword      pantalkFunction         get_window_screen
syn keyword      pantalkFunction         get_window_size
syn keyword      pantalkFunction         grab_on_event
syn keyword      pantalkFunction         hide_pnl
syn keyword      pantalkFunction         initrs232debug
syn keyword      pantalkFunction         init_vdx
syn keyword      pantalkFunction         insert_line
syn keyword      pantalkFunction         int2adr
syn keyword      pantalkFunction         integer_to_date
syn keyword      pantalkFunction         integer_to_string
syn keyword      pantalkFunction         ird_delete_module
syn keyword      pantalkFunction         ird_load_abort
syn keyword      pantalkFunction         ird_module_info
syn keyword      pantalkFunction         ird_mount
syn keyword      pantalkFunction         ird_rcv_module
syn keyword      pantalkFunction         ird_umount
syn keyword      pantalkFunction         line_count
syn keyword      pantalkFunction         line_search
syn keyword      pantalkFunction         link_panel
syn keyword      pantalkFunction         load_module
syn keyword      pantalkFunction         load_text
syn keyword      pantalkFunction         lzw_expand_buffer
syn keyword      pantalkFunction         md5_buffer
syn keyword      pantalkFunction         module_end
syn keyword      pantalkFunction         move_display
syn keyword      pantalkFunction         msg_vdx
syn keyword      pantalkFunction         new_panel
syn keyword      pantalkFunction         open_debug
syn keyword      pantalkFunction         open_df
syn keyword      pantalkFunction         pad_code
syn keyword      pantalkFunction         pad_decode
syn keyword      pantalkFunction         peek_event
syn keyword      pantalkFunction         pmt_scan_ca
syn keyword      pantalkFunction         pmt_search_fdl
syn keyword      pantalkFunction         pmt_selaudio
syn keyword      pantalkFunction         pmt_selsstt
syn keyword      pantalkFunction         pmt_trt
syn keyword      pantalkFunction         pool_info
syn keyword      pantalkFunction         put_df
syn keyword      pantalkFunction         put_event
syn keyword      pantalkFunction         quit_panel
syn keyword      pantalkFunction         read_bit
syn keyword      pantalkFunction         read_df
syn keyword      pantalkFunction         read_icofile
syn keyword      pantalkFunction         read_keyboard
syn keyword      pantalkFunction         read_string
syn keyword      pantalkFunction         read_text
syn keyword      pantalkFunction         read_utc_time
syn keyword      pantalkFunction         read_versions
syn keyword      pantalkFunction         real_to_string
syn keyword      pantalkFunction         refresh_po_var
syn keyword      pantalkFunction         reset_array
syn keyword      pantalkFunction         reset_object
syn keyword      pantalkFunction         reset_public_key
syn keyword      pantalkFunction         restore_file
syn keyword      pantalkFunction         restore_text
syn keyword      pantalkFunction         rsa_ucrypt
syn keyword      pantalkFunction         searchmem
syn keyword      pantalkFunction         search_descriptor_list
syn keyword      pantalkFunction         search_line
syn keyword      pantalkFunction         seek_df
syn keyword      pantalkFunction         setcontrolwords
syn keyword      pantalkFunction         setmem
syn keyword      pantalkFunction         set_buffer_outline
syn keyword      pantalkFunction         set_card
syn keyword      pantalkFunction         set_client_id
syn keyword      pantalkFunction         set_ctrl
syn keyword      pantalkFunction         set_eeprom
syn keyword      pantalkFunction         set_input_format
syn keyword      pantalkFunction         set_language
syn keyword      pantalkFunction         set_limevt
syn keyword      pantalkFunction         set_mematt
syn keyword      pantalkFunction         set_mpeg
syn keyword      pantalkFunction         set_native_code
syn keyword      pantalkFunction         set_object_buffer
syn keyword      pantalkFunction         set_panel_icofile
syn keyword      pantalkFunction         set_panel_key
syn keyword      pantalkFunction         set_panel_page
syn keyword      pantalkFunction         set_panel_value
syn keyword      pantalkFunction         set_pg_sel
syn keyword      pantalkFunction         set_po_att
syn keyword      pantalkFunction         set_po_bargraph
syn keyword      pantalkFunction         set_po_enum
syn keyword      pantalkFunction         set_po_focus
syn keyword      pantalkFunction         set_po_font
syn keyword      pantalkFunction         set_po_icone
syn keyword      pantalkFunction         set_po_icone2
syn keyword      pantalkFunction         set_po_image
syn keyword      pantalkFunction         set_po_link
syn keyword      pantalkFunction         set_po_numtext
syn keyword      pantalkFunction         set_po_realtext
syn keyword      pantalkFunction         set_po_script
syn keyword      pantalkFunction         set_po_shift
syn keyword      pantalkFunction         set_po_state
syn keyword      pantalkFunction         set_po_text
syn keyword      pantalkFunction         set_po_viewline
syn keyword      pantalkFunction         set_proc_table
syn keyword      pantalkFunction         set_public_key
syn keyword      pantalkFunction         set_public_validity
syn keyword      pantalkFunction         set_spanel_page
syn keyword      pantalkFunction         set_to
syn keyword      pantalkFunction         set_trace
syn keyword      pantalkFunction         set_zda
syn keyword      pantalkFunction         show_pnl
syn keyword      pantalkFunction         sizeofvar
syn keyword      pantalkFunction         sortmem
syn keyword      pantalkFunction         sorttable
syn keyword      pantalkFunction         space_string
syn keyword      pantalkFunction         start_panel
syn keyword      pantalkFunction         str2display
syn keyword      pantalkFunction         str_scan
syn keyword      pantalkFunction         strcut_end
syn keyword      pantalkFunction         string_lower
syn keyword      pantalkFunction         string_search
syn keyword      pantalkFunction         string_string
syn keyword      pantalkFunction         string_to_integer
syn keyword      pantalkFunction         string_to_real
syn keyword      pantalkFunction         string_upper
syn keyword      pantalkFunction         swapmem
syn keyword      pantalkFunction         switch_po_priorities
syn keyword      pantalkFunction         take_sem
syn keyword      pantalkFunction         tell_df
syn keyword      pantalkFunction         time_sys
syn keyword      pantalkFunction         trace
syn keyword      pantalkFunction         translate_event_code
syn keyword      pantalkFunction         utc_add
syn keyword      pantalkFunction         utc_cmp
syn keyword      pantalkFunction         utc_diff
syn keyword      pantalkFunction         unload_module
syn keyword      pantalkFunction         var_copy
syn keyword      pantalkFunction         verify_hd_string
syn keyword      pantalkFunction         wait_event
syn keyword      pantalkFunction         wait_events
syn keyword      pantalkFunction         warm_start_info
syn keyword      pantalkFunction         write_bit
syn keyword      pantalkFunction         write_df
syn keyword      pantalkFunction         write_string
syn keyword      pantalkFunction         write_text
syn keyword      pantalkFunction         write_utc_time
syn keyword      pantalkFunction         xdraw_line
syn keyword      pantalkFunction         xdraw_point
syn keyword      pantalkFunction         xdraw_poly
syn keyword      pantalkFunction         xdraw_rectangle
syn keyword      pantalkFunction         xdraw_roundrect
syn keyword      pantalkFunction         xdraw_string
syn keyword      pantalkFunction         xflush
syn keyword      pantalkFunction         xget_drawing_att
syn keyword      pantalkFunction         xget_point
syn keyword      pantalkFunction         xget_screen_att
syn keyword      pantalkFunction         xpaint_rectangle
syn keyword      pantalkFunction         xpaint_roundrect
syn keyword      pantalkFunction         xset_drawing_att
syn keyword      pantalkFunction         xcopy_area
syn keyword      pantalkFunction         xctl
syn keyword      pantalkFunction         xget_buffer
syn keyword      pantalkFunction         xget_colormap
syn keyword      pantalkFunction         xget_font_number
syn keyword      pantalkFunction         xget_font_size
syn keyword      pantalkFunction         xget_string_size
syn keyword      pantalkFunction         xhide_window
syn keyword      pantalkFunction         xormem
syn keyword      pantalkFunction         xset_buffer
syn keyword      pantalkFunction         xset_colormap
syn keyword      pantalkFunction         xset_font
syn keyword      pantalkFunction         xshow_window
syn keyword      pantalkFunction         get_tcs_struct
syn keyword      pantalkFunction         get_tpt_struct
syn keyword      pantalkFunction         tcs_att
syn keyword      pantalkFunction         tcs_deplace
syn keyword      pantalkFunction         tcs_init
syn keyword      pantalkFunction         tcs_read
syn keyword      pantalkFunction         tcs_read_name
syn keyword      pantalkFunction         tcs_search
syn keyword      pantalkFunction         tcs_service
syn keyword      pantalkFunction         tcs_write
syn keyword      pantalkFunction         tcs_write_name
syn keyword      pantalkFunction         tpt_init
syn keyword      pantalkFunction         tpt_read
syn keyword      pantalkFunction         tpt_search
syn keyword      pantalkFunction         tpt_write
syn keyword      pantalkFunction         smode
syn keyword      pantalkFunction         gmode

syn region       pantalkTrace      	 start="\<tr_" end="\>" contains=ALL

" Match words with sensitive cases
syn case match


"syn match       pantalkEnvVar           "\$\<ALARM_EVT\>"
"syn match       pantalkEnvVar           "\$\<BACKUP_INFO\>"
"syn match       pantalkEnvVar           "\$\<BACKUP_WRITE\>"
"syn match       pantalkEnvVar           "\$\<CLOCK_ALARM_DELETE\>"
"syn match       pantalkEnvVar           "\$\<CLOCK_ALARM_INFO\>"
"syn match       pantalkEnvVar           "\$\<CLOCK_ALARM_LIST\>"
"syn match       pantalkEnvVar           "\$\<CLOCK_ALARM_MODIF\>"
"syn match       pantalkEnvVar           "\$\<CLOCK_ALARM_SET\>"
"syn match       pantalkEnvVar           "\$\<CLOCK_OFFSET_GMT\>"
"syn match       pantalkEnvVar           "\$\<CLOCK_TIME_INFO\>"
"syn match       pantalkEnvVar           "\$\<CLOCK_TIME_SET\>"
"syn match       pantalkEnvVar           "\$\<CLOCK_USER_DELETE\>"
"syn match       pantalkEnvVar           "\$\<CLOCK_WAKE_UP_SET\>"
"syn match       pantalkEnvVar           "\$\<DISPLAY_SET_BITMAP\>"
"syn match       pantalkEnvVar           "\$\<DISPLAY_SET_DISPLAY\>"
"syn match       pantalkEnvVar           "\$\<DISPLAY_SET_HOUR\>"
"syn match       pantalkEnvVar           "\$\<EMM_GET_CAT\>"
"syn match       pantalkEnvVar           "\$\<EMM_OPI_TABLE\>"
"syn match       pantalkEnvVar           "\$\<EMM_START\>"
"syn match       pantalkEnvVar           "\$\<EMM_STOP\>"
"syn match       pantalkEnvVar           "\$\<EV_EMM_CODED\>"
"syn match       pantalkEnvVar           "\$\<EV_EMM_SW\>"
"syn match       pantalkEnvVar           "\$\<EV_EMM_UNCODED\>"
"syn match       pantalkEnvVar           "\$\<EV_FDLOAD_APP\>"
"syn match       pantalkEnvVar           "\$\<EV_FDLOAD_BEGIN\>"
"syn match       pantalkEnvVar           "\$\<EV_FDLOAD_END\>"
"syn match       pantalkEnvVar           "\$\<EV_FDLOAD_INDEX\>"
"syn match       pantalkEnvVar           "\$\<EV_LCARD_EXTRACT\>"
"syn match       pantalkEnvVar           "\$\<EV_LCARD_INSERT\>"
"syn match       pantalkEnvVar           "\$\<EV_LCARD_RESET\>"
"syn match       pantalkEnvVar           "\$\<EV_MLOAD_GETALL\>"
"syn match       pantalkEnvVar           "\$\<EV_MODEM_CHAR\>"
"syn match       pantalkEnvVar           "\$\<EV_MODEM_ENQ\>"
"syn match       pantalkEnvVar           "\$\<EV_MODEM_MSG\>"
"syn match       pantalkEnvVar           "\$\<EV_MODEM_OFF\>"
"syn match       pantalkEnvVar           "\$\<EV_PARALLEL_OFF\>"
"syn match       pantalkEnvVar           "\$\<EV_PARALLEL_RECEIVE\>"
"syn match       pantalkEnvVar           "\$\<EV_RCARD_EXTRACT\>"
"syn match       pantalkEnvVar           "\$\<EV_RCARD_INSERT\>"
"syn match       pantalkEnvVar           "\$\<EV_RCARD_RESET\>"
"syn match       pantalkEnvVar           "\$\<EV_SCVCR_COMMUT\>"
"syn match       pantalkEnvVar           "\$\<EV_SERIAL_OFF\>"
"syn match       pantalkEnvVar           "\$\<EV_SERIAL_RECEIVE\>"
"syn match       pantalkEnvVar           "\$\<EV_SERVICE_BAD_NB\>"
"syn match       pantalkEnvVar           "\$\<EV_SERVICE_ECM\>"
"syn match       pantalkEnvVar           "\$\<EV_SERVICE_FORMAT\>"
"syn match       pantalkEnvVar           "\$\<EV_SERVICE_GETALL\>"
"syn match       pantalkEnvVar           "\$\<EV_SERVICE_OFF\>"
"syn match       pantalkEnvVar           "\$\<EV_TUNER_BER\>"
"syn match       pantalkEnvVar           "\$\<EV_TUNER_CARRIER\>"
"syn match       pantalkEnvVar           "\$\<FDLOAD_INDEX\>"
"syn match       pantalkEnvVar           "\$\<FDLOAD_OFFLINE\>"
"syn match       pantalkEnvVar           "\$\<FDLOAD_ONLINE\>"
"syn match       pantalkEnvVar           "\$\<FDLOAD_STATUS\>"
"syn match       pantalkEnvVar           "\$\<GMODE\>"
"syn match       pantalkEnvVar           "\$\<GTRIGO\>"
"syn match       pantalkEnvVar           "\$\<LCARD_HISTO\>"
"syn match       pantalkEnvVar           "\$\<LCARD_INPUT\>"
"syn match       pantalkEnvVar           "\$\<LCARD_OUTPUT\>"
"syn match       pantalkEnvVar           "\$\<LCARD_RESET\>"
"syn match       pantalkEnvVar           "\$\<LCARD_STATE\>"
"syn match       pantalkEnvVar           "\$\<MLOAD_DELETE\>"
"syn match       pantalkEnvVar           "\$\<MLOAD_DELETE_ALL\>"
"syn match       pantalkEnvVar           "\$\<MLOAD_DESCRIPT\>"
"syn match       pantalkEnvVar           "\$\<MLOAD_DIRECTORY\>"
"syn match       pantalkEnvVar           "\$\<MLOAD_GROUP_ADD\>"
"syn match       pantalkEnvVar           "\$\<MLOAD_GROUP_LOAD\>"
"syn match       pantalkEnvVar           "\$\<MLOAD_GROUP_SUP\>"
"syn match       pantalkEnvVar           "\$\<MLOAD_INFO\>"
"syn match       pantalkEnvVar           "\$\<MLOAD_LOAD_ABORT\>"
"syn match       pantalkEnvVar           "\$\<MLOAD_SECTION\>"
"syn match       pantalkEnvVar           "\$\<MLOAD_SECTION_ALL\>"
"syn match       pantalkEnvVar           "\$\<MLOAD_TABLE_LOAD\>"
"syn match       pantalkEnvVar           "\$\<MODEM_DECONNEXION\>"
"syn match       pantalkEnvVar           "\$\<MODEM_DTMF_DIAL\>"
"syn match       pantalkEnvVar           "\$\<MODEM_SEND\>"
"syn match       pantalkEnvVar           "\$\<MODEM_SEND_ENQ\>"
"syn match       pantalkEnvVar           "\$\<MODEM_SET\>"
"syn match       pantalkEnvVar           "\$\<PARALLEL_SEND\>"
"syn match       pantalkEnvVar           "\$\<POWER_ON_INFO\>"
"syn match       pantalkEnvVar           "\$\<POWER_STDBY_ON\>"
"syn match       pantalkEnvVar           "\$\<RCARD_HISTO\>"
"syn match       pantalkEnvVar           "\$\<RCARD_INPUT\>"
"syn match       pantalkEnvVar           "\$\<RCARD_OUTPUT\>"
"syn match       pantalkEnvVar           "\$\<RCARD_RESET\>"
"syn match       pantalkEnvVar           "\$\<RCARD_STATE\>"
"syn match       pantalkEnvVar           "\$\<SCTV_BYPSS_INFO\>"
"syn match       pantalkEnvVar           "\$\<SCTV_MUTE_SET\>"
"syn match       pantalkEnvVar           "\$\<SCTV_RGB_INFO\>"
"syn match       pantalkEnvVar           "\$\<SCTV_SET_BYPSS\>"
"syn match       pantalkEnvVar           "\$\<SCTV_SET_LVL_SND\>"
"syn match       pantalkEnvVar           "\$\<SCTV_SET_RGB\>"
"syn match       pantalkEnvVar           "\$\<SCTV_SET_SND_TYPE\>"
"syn match       pantalkEnvVar           "\$\<SCTV_SET_SWITCHING\>"
"syn match       pantalkEnvVar           "\$\<SCTV_SET_TV\>"
"syn match       pantalkEnvVar           "\$\<SCTV_SIG_RGB_INFO\>"
"syn match       pantalkEnvVar           "\$\<SCTV_SIG_RGB_SET\>"
"syn match       pantalkEnvVar           "\$\<SCTV_SIG_RGB_WRT\>"
"syn match       pantalkEnvVar           "\$\<SCTV_SND_LVL_INFO\>"
"syn match       pantalkEnvVar           "\$\<SCTV_SND_TYPE_INFO\>"
"syn match       pantalkEnvVar           "\$\<SCTV_SWITCHING_INFO\>"
"syn match       pantalkEnvVar           "\$\<SCTV_TV_INFO\>"
"syn match       pantalkEnvVar           "\$\<SCTV_WRT_LVL_SND\>"
"syn match       pantalkEnvVar           "\$\<SCTV_WRT_RGB\>"
"syn match       pantalkEnvVar           "\$\<SCTV_WRT_SND_TYPE\>"
"syn match       pantalkEnvVar           "\$\<SCTV_WRT_SWITCHING\>"
"syn match       pantalkEnvVar           "\$\<SCTV_WRT_TV\>"
"syn match       pantalkEnvVar           "\$\<SCVCR_COMMUT_INFO\>"
"syn match       pantalkEnvVar           "\$\<SCVCR_SET_SND_TYPE\>"
"syn match       pantalkEnvVar           "\$\<SCVCR_SET_VIDEO\>"
"syn match       pantalkEnvVar           "\$\<SCVCR_SND_TYPE_INFO\>"
"syn match       pantalkEnvVar           "\$\<SCVCR_VIDEO_INFO\>"
"syn match       pantalkEnvVar           "\$\<SCVCR_WRT_SND_TYPE\>"
"syn match       pantalkEnvVar           "\$\<SCVCR_WRT_VIDEO\>"
"syn match       pantalkEnvVar           "\$\<SERIAL_SEND\>"
"syn match       pantalkEnvVar           "\$\<SERIAL_SETUP\>"
"syn match       pantalkEnvVar           "\$\<SERVICE_ADD_ECM\>"
"syn match       pantalkEnvVar           "\$\<SERVICE_BLK_SCREEN\>"
"syn match       pantalkEnvVar           "\$\<SERVICE_DEL_ALL_PICTURE\>"
"syn match       pantalkEnvVar           "\$\<SERVICE_DEL_ECM\>"
"syn match       pantalkEnvVar           "\$\<SERVICE_DEL_PICTURE\>"
"syn match       pantalkEnvVar           "\$\<SERVICE_DEMUX_INFO\>"
"syn match       pantalkEnvVar           "\$\<SERVICE_DEMUX_PID\>"
"syn match       pantalkEnvVar           "\$\<SERVICE_DISPLAY_PICTURE\>"
"syn match       pantalkEnvVar           "\$\<SERVICE_ECM_INFO\>"
"syn match       pantalkEnvVar           "\$\<SERVICE_FORMAT_INFO\>"
"syn match       pantalkEnvVar           "\$\<SERVICE_FREEZE\>"
"syn match       pantalkEnvVar           "\$\<SERVICE_MODIFY\>"
"syn match       pantalkEnvVar           "\$\<SERVICE_PID_INFO\>"
"syn match       pantalkEnvVar           "\$\<SERVICE_PLAY\>"
"syn match       pantalkEnvVar           "\$\<SERVICE_SET_ECM\>"
"syn match       pantalkEnvVar           "\$\<SERVICE_SET_MODE\>"
"syn match       pantalkEnvVar           "\$\<SERVICE_SET_PID\>"
"syn match       pantalkEnvVar           "\$\<SERVICE_SET_SUBTITLES\>"
"syn match       pantalkEnvVar           "\$\<SERVICE_START\>"
"syn match       pantalkEnvVar           "\$\<SERVICE_STOP\>"
"syn match       pantalkEnvVar           "\$\<SERVICE_STOP_PID\>"
"syn match       pantalkEnvVar           "\$\<SMODE\>"
"syn match       pantalkEnvVar           "\$\<SOUND_BIP\>"
"syn match       pantalkEnvVar           "\$\<SOUND_SAMPLE_LEVEL\>"
"syn match       pantalkEnvVar           "\$\<SOUND_SAMPLE_PLAY\>"
"syn match       pantalkEnvVar           "\$\<SOUND_SAMPLE_STOP\>"
"syn match       pantalkEnvVar           "\$\<STRIGO\>"
"syn match       pantalkEnvVar           "\$\<TUNER_AGC_READ\>"
"syn match       pantalkEnvVar           "\$\<TUNER_BER_READ\>"
"syn match       pantalkEnvVar           "\$\<TUNER_FREQ_INFO\>"
"syn match       pantalkEnvVar           "\$\<TUNER_NEXT_SCANNING\>"
"syn match       pantalkEnvVar           "\$\<TUNER_START_SCANNING\>"
"syn match       pantalkEnvVar           "\$\<TUNER_TUNING_INFO\>"
"syn match       pantalkEnvVar           "\$\<TUNER_TUNING_SET\>"
syn region      pantalkEnvVar           start="\$\<" end="\>" contains=ALL

syn keyword	pantalkTodo		contained TODO FIXME XXXX ####
syn match	pantalkTodo		"##*#"

" String and Character constants
" Highlight special characters (those which have a backslash) differently
syn match	pantalkSpecial	        contained "\\x\x\+\|\\\o\{1,3\}\|\\.\|\\$"
syn region	pantalkString		start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=pantalkSpecial
syn match	pantalkCharacter	"'[^\\]'"
syn match	pantalkSpecialCharacter "'\\.'"
syn match	pantalkSpecialCharacter "'\\\o\{1,3\}'"

"when wanted, highlight trailing white space
if exists("pantalk_space_errors")
  syn match	pantalkSpaceError	"\s*$"
  syn match	pantalkSpaceError	" \+\t"me=e-1
endif

"catch errors caused by wrong parenthesis
syn cluster	pantalkParenGroup	contains=pantalkParenError,pantalkIncluded,pantalkSpecial,pantalkTodo,cUserCont,pantalkUserLabel,pantalkBitField
syn region	pantalkParen		transparent start='(' end=')' contains=ALLBUT,@pantalkParenGroup
syn match	pantalkParenError	")"
syn match	pantalkInParen	        contained "[{}]"

"integer number, or floating point number without a dot and with "f".
syn case ignore
syn match	pantalkNumber		"\<\d\+\(u\=l\=\|lu\|f\)\>"
"floating point number, with dot, optional exponent
syn match	pantalkFloat		"\<\d\+\.\d*\(e[-+]\=\d\+\)\=[fl]\=\>"
"floating point number, starting with a dot, optional exponent
syn match	pantalkFloat		"\.\d\+\(e[-+]\=\d\+\)\=[fl]\=\>"
"floating point number, without dot, with exponent
syn match	pantalkFloat		"\<\d\+e[-+]\=\d\+[fl]\=\>"
"hex number
syn match	pantalkNumber		"\<0x\x\+\(u\=l\=\|lu\)\>"
"syn match pantalkIdentifier	"\<[a-z_][a-z0-9_]*\>"
syn case match
" flag an octal number with wrong digits
syn match	pantalkOctalError	"\<0\o*[89]"

if exists("pantalk_comment_strings")
  " A comment can contain pantalkString, pantalkCharacter and pantalkNumber.
  " But a "*/" inside a cString in a pantalkComment DOES end the comment!  So we
  " need to use a special type of pantalkString: pantalkCommentString, which also ends on
  " "*/", and sees a "*" at the start of the line as comment again.
  " Unfortunately this doesn't very well work for // type of comments :-(
  syntax match	pantalkCommentSkip	contained "^\s*\*\($\|\s\+\)"
  syntax region pantalkCommentString	contained start=+"+ skip=+\\\\\|\\"+ end=+"+ end=+\*/+me=s-1 contains=pantalkSpecial,pantalkCommentSkip
  syntax region pantalkComment2String	contained start=+"+ skip=+\\\\\|\\"+ end=+"+ end="$" contains=pantalkSpecial
  syntax region pantalkComment	        start="/\*" end="\*/" contains=pantalkTodo,pantalkCommentString,pantalkCharacter,pantalkNumber,pantalkFloat,pantalkSpaceError
  syntax match  pantalkComment	        "//.*" contains=pantalkTodo,pantalkComment2String,pantalkCharacter,pantalkNumber,pantalkSpaceError
else
  syn region	pantalkComment  	start="/\*" end="\*/" contains=pantalkTodo,pantalkSpaceError
  syn match	pantalkComment	        "//.*" contains=pantalkTodo,pantalkSpaceError
endif
syntax match	pantalkCommentError	"\*/"

syn keyword	pantalkType		INT REAL
syn keyword	pantalkType		int real
syn keyword	pantalkStructure	PARAMETER
syn keyword	pantalkStructure	parameter
syn keyword	pantalkStorageClass	VALUE
syn keyword	pantalkStorageClass	value

syn region	pantalkPreCondit	start="^#\s*\(if\>\|ifdef\>\|ifndef\>\|elif\>\|else\>\|endif\>\)" skip="\\$" end="$" contains=pantalkComment,pantalkString,pantalkCharacter,pantalkNumber,pantalkCommentError,pantalkSpaceError
syn region	pantalkIncluded         contained start=+"+ skip=+\\\\\|\\"+ end=+"+
syn match	pantalkIncluded	        contained "<[^>]*>"
syn match	pantalkInclude	        "^#\s*include\>\s*["<]" contains=pantalkIncluded
"syn match pantalkLineSkip	"\\$"
syn cluster	pantalkPreProcGroup	contains=pantalkPreCondit,pantalkIncluded,pantalkInclude,pantalkDefine,pantalkInParen,pantalkUserLabel,pantalkTrace
syn region	pantalkDefine		start="^#\s*\(define\>\|undef\>\)" skip="\\$" end="$" contains=ALLBUT,@pantalkPreProcGroup
syn region	pantalkPreProc  	start="^#\s*\(pragma\>\|line\>\|warning\>\|warn\>\|error\>\)" skip="\\$" end="$"


" Highlight User Labels
syn cluster	pantalkMultiGroup	contains=pantalkIncluded,pantalkSpecial,pantalkTodo,pantalkUserCont,pantalkUserLabel,pantalkBitField
syn region	pantalkMulti		transparent start='?' end=':' contains=ALLBUT,@pantalkMultiGroup
" Avoid matching foo::bar() in C++ by requiring that the next char is not ':'
"syn match	pantalkUserCont	        "^\s*\I\i*\s*:$" contains=pantalkUserLabel
"syn match	pantalkUserCont	        ";\s*\I\i*\s*:$" contains=pantalkUserLabel
"syn match	pantalkUserCont	        "^\s*\I\i*\s*:[^:]"me=e-1 contains=pantalkUserLabel
"syn match	pantalkUserCont	        ";\s*\I\i*\s*:[^:]"me=e-1 contains=pantalkUserLabel

"syn match	pantalkUserLabel	"\I\i*" contained

" Avoid recognizing most bitfields as labels
"syn match	pantalkBitField	        "^\s*\I\i*\s*:\s*[1-9]"me=e-1
"syn match	pantalkBitField	        ";\s*\I\i*\s*:\s*[1-9]"me=e-1

if !exists("pantalk_minlines")
  let pantalk_minlines = 15
endif
exec "syn sync ccomment pantalkComment minlines=" . pantalk_minlines

if !exists("did_pantalk_syntax_inits")
  let did_pantalk_syntax_inits = 1
  " The default methods for highlighting.  Can be overridden later
  hi link pantalkLabel	        Label
  hi link pantalkUserLabel	Label
  hi link pantalkConditional	Conditional
  hi link pantalkRepeat	        Repeat
  hi link pantalkCharacter	Character
  hi link pantalkSpecialCharacter pantalkSpecial
  hi link pantalkNumber	        Number
  hi link pantalkFloat	        Float
  hi link pantalkOctalError	pantalkError
  hi link pantalkParenError	pantalkError
  hi link pantalkInParen	pantalkError
  hi link pantalkCommentError	pantalkError
  hi link pantalkSpaceError	pantalkError
  hi link pantalkOperator	Operator
  hi link pantalkStructure	Structure
  hi link pantalkStorageClass	StorageClass
  hi link pantalkInclude	Include
  hi link pantalkPreProc	PreProc
  hi link pantalkDefine	        Macro
  hi link pantalkIncluded	pantalkString
  hi link pantalkError	        Error
  hi link pantalkStatement	Statement
  hi link pantalkPreCondit	PreCondit
  hi link pantalkType		Type
  hi link pantalkCommentError	pantalkError
  hi link pantalkCommentString  pantalkString
  hi link pantalkComment2String pantalkString
  hi link pantalkCommentSkip	pantalkComment
  hi link pantalkString 	String
  hi link pantalkComment	Comment
  hi link pantalkSpecial	SpecialChar
  hi link pantalkTodo		Todo
  hi link pantalkFunction	Function
  hi link pantalkTrace	        Macro
  hi link pantalkEnvVar	        Label
  "hi link pantalkIdentifier	Identifier
endif

let b:current_syntax = "pantalk"

"add dico of pantalk keywords
set dict=$VIM/dico/pantalk.dico
set cpt+=k

" vim: ts=8
