if status is-interactive
    # Commands to run in interactive sessions can go here
    # fastfetch --logo nix_old_small
    eval (ssh-agent -c)
    ssh-add
    starship init fish | source
    any-nix-shell fish --info-right | source
    direnv hook fish | source
end

set fish_greeting
