# =====================
# ZSH BASIC
# =====================
export ZSH="$HOME/.zsh"
export EDITOR=nvim
export TERMINAL=gnome-terminal

# =====================
# HISTORY
# =====================
HISTSIZE=10000
SAVEHIST=10000
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_space

# =====================
# AUTOCOMPLETE
# =====================
autoload -Uz compinit
compinit
eval "$(zoxide init zsh)"
# eval "$(fnm env --use-on-cd)"

# =====================
# PLUGINS (FAST)
# =====================
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# =====================
# STARSHIP PROMPT
# =====================
eval "$(starship init zsh)"

# =====================
# ALIASES (DEV FRIENDLY)
# =====================
# alias ll='ls -lah'
alias cat='batcat'
alias ls='lsd'
alias cd='z'


# =====================
# NODE / BUN
# =====================
# export PATH="$HOME/.bun/bin:$PATH"


# =====================
# ANDROID SETUP
# =====================
# =====================
# ANDROID SETUP
# =====================
# Android SDK
export ANDROID_HOME=/usr/lib/android-sdk
export ANDROID_SDK_ROOT=/usr/lib/android-sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools/bin


# fnm
FNM_PATH="/home/kernelcraft/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi
