export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export CARGO_HOME="$XDG_DATA_HOME"/cargo
#

# fnm
export PATH="/home/likendev/.local/share/fnm:$PATH"
eval "`fnm env`"
eval "$(fnm env --use-on-cd)"

# pnpm
export PNPM_HOME="/home/likendev/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# pnpm end
# Added by Toolbox App
export PATH="$PATH:/home/likendev/.local/share/JetBrains/Toolbox/scripts"

