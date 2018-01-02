### Misc PATHs ###

# Go
export GOPATH="$HOME/go"
[ -d "$GOPATH/go" ] && export GOROOT="$GOPATH/go"

# ADK
export ANDROID_HOME="$HOME/.local/android-sdk"


### Executable PATH ###

# Rust bin
export PATH="$HOME/.cargo/bin:$PATH"

# ADK bin
[ -n "$ANDROID_HOME" -a -d "$ANDROID_HOME" ] && \
  export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH"

# Go bin
[ -n "$GOPATH" -a -d "$GOPATH/bin" ] && export PATH="$GOPATH/bin:$PATH"
[ -n "$GOROOT" -a -d "$GOROOT" ] && export PATH="$GOROOT/bin$PATH:"

# User-local NPM bin
[ -d "$HOME/.npm-global" ] && export PATH="$HOME/.npm-global/bin:$PATH"

# Luarocks bin
command -v luarocks >/dev/null 2>&1 && eval $(luarocks path --bin)

# User bin
[ -d "$HOME/bin" ] && export PATH="$HOME/bin:$PATH"
# Scripts from .config/nelsonc
[ -d "$HOME/.config/nelsonc" ] && export PATH="$HOME/.config/nelsonc/scripts:$PATH"

# Project-local NPM bin
export PATH="./node_modules/.bin:$PATH"


### pkgconfig PATH ###
export PKG_CONFIG_PATH="$HOME/lib/pkgconfig:$PKG_CONFIG_PATH"
