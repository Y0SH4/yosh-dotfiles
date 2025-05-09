$env.config.show_banner = false
$env.config.table.mode = 'rounded'
$env.EDITOR = "nvim"

# pokemon
do {
  ^pokemon-colorscripts -r --no-title
}

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
