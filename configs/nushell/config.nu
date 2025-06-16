$env.config.show_banner = false
$env.config.table.mode = 'rounded'
$env.EDITOR = "nvim"

# pokemon
do {
  ^pokemon-colorscripts -r --no-title
}

# Auto-start tmux
if (which tmux | is-empty) == false {
    # Check if we're not already in a tmux session
    let tmux_exists = ($env | get -i TMUX | default "")
    if ($tmux_exists == "") {
        ^tmux new-session -A -s main
    }
}
# Go
let go_path = '/usr/local/go/bin'
$env.PATH = ($env.PATH | prepend $go_path)

# starship
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# Set Volta environment variable
let VOLTA_HOME = ($nu.home-path | path join ".volta")

# Set environment variables directly
$env.VOLTA_HOME = $VOLTA_HOME
$env.PATH = ($env.PATH | append [$env.VOLTA_HOME, ($env.VOLTA_HOME | path join "bin")])

# alias
alias v = nvim
alias vi = nvim
alias vim = nvim
