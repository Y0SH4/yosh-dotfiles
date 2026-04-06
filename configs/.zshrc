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
# ALIASES
# =====================
alias cat='bat'
alias ll='ls -lah'

# =====================
# ANDROID SETUP (PORTABLE)
# =====================
export ANDROID_HOME="$HOME/Android/Sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"

# Add Android tools to PATH safely
[ -d "$ANDROID_HOME/cmdline-tools/latest/bin" ] && export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"
[ -d "$ANDROID_HOME/platform-tools" ] && export PATH="$ANDROID_HOME/platform-tools:$PATH"
[ -d "$ANDROID_HOME/emulator" ] && export PATH="$ANDROID_HOME/emulator:$PATH"

# =====================
# FNM (NODE VERSION MANAGER)
# =====================
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env --use-on-cd --shell zsh)"
fi

# =====================
# OPTIONAL DEV ALIASES
# =====================
alias adb-restart='adb kill-server && adb start-server'
alias adb-devices='adb devices'export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
