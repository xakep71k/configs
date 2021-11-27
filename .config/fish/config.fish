set PATH ~/soft/platform-tools ~/soft/anaconda3/bin /home/alek/.local/bin /home/alek/bin /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/games /usr/local/games /snap/bin /home/alek/.fzf/bin /home/alek/go/bin ~/.cargo/bin

if status is-interactive
    # Commands to run in interactive sessions can go here
end

#function fish_user_key_bindings
#  bind \c] peco_select_ghq      # Ctrl-]
#  bind \cr peco_select_history  # Ctrl-r
#  bind \cj peco_select_z        # Ctrl-j
#  bind \cf peco_select_file     # Ctrl-f
#end
set fish_prompt_pwd_dir_length 0
alias ls="ls --icons"
alias f=fg
