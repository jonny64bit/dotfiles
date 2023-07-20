if status is-interactive
    # Commands to run in interactive sessions can go here
end

nvm use default --silent

starship init fish | source