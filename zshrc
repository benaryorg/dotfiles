#!/usr/bin/env zsh

HISTSIZE=1000000000
SAVEHIST=1000000000
INC_APPEND_HISTORY=1000000000
HISTFILE=~/.histfile
IFS=$'\n'

TIMEFMT+=" max RSS %M"

test -r /etc/profile && source /etc/profile

PLATFORM=$(uname -s)

function gnu()
{
	test "${PLATFORM}" = "Linux"
}

function openbsd()
{
	test "${PLATFORM}" = "OpenBSD"
}

function freebsd()
{
	test "${PLATFORM}" = "FreeBSD"
}

function netbsd()
{
	test "${PLATFORM}" = "NetBSD"
}

function bsd()
{
	openbsd || freebsd || netbsd
}

function darwin()
{
	test "${PLATFORM}" = "Darwin"
}

autoload -U compinit && compinit -D 2>&1 >/dev/null
autoload -U compaudit && compaudit 2>&1 >/dev/null
autoload -U promptinit && promptinit 2>&1 >/dev/null
autoload -U colors && colors 2>&1 >/dev/null

bindkey -v
bindkey "^I" complete-word
bindkey -M vicmd "^I" complete-word
bindkey "^[[5~" history-beginning-search-backward
bindkey -M vicmd "^[[5~" history-beginning-search-backward
bindkey "^[[6~" history-beginning-search-forward
bindkey -M vicmd "^[[6~" history-beginning-search-forward
bindkey "^[[H" beginning-of-line
bindkey -M vicmd "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey -M vicmd "^[[F" end-of-line
bindkey "^[[3~" delete-char
bindkey -M vicmd "^[[3~" delete-char

bindkey -M viins '^R' history-incremental-pattern-search-backward

PROMPT="%B%(!.%F{red}.%F{green}%n@)%m%k %B%F{blue}%(!.%1~.%~) %F{%(?.green.red)}%# %b%f%k"

zstyle ':completion:*' list-colors "rs=0" "di=01;34" "ln=01;36" "mh=00" "pi=40;33" "so=01;35" "do=01;35" "bd=40;33;01" "cd=40;33;01" "or=01;05;37;41" "mi=01;05;37;41" "su=37;41" "sg=30;43" "ca=30;41" "tw=30;42" "ow=34;42" "st=37;44" "ex=01;32" "*.tar=01;31" "*.tgz=01;31" "*.arc=01;31" "*.arj=01;31" "*.taz=01;31" "*.lha=01;31" "*.lz4=01;31" "*.lzh=01;31" "*.lzma=01;31" "*.tlz=01;31" "*.txz=01;31" "*.tzo=01;31" "*.t7z=01;31" "*.zip=01;31" "*.z=01;31" "*.Z=01;31" "*.dz=01;31" "*.gz=01;31" "*.lrz=01;31" "*.lz=01;31" "*.lzo=01;31" "*.xz=01;31" "*.bz2=01;31" "*.bz=01;31" "*.tbz=01;31" "*.tbz2=01;31" "*.tz=01;31" "*.deb=01;31" "*.rpm=01;31" "*.jar=01;31" "*.war=01;31" "*.ear=01;31" "*.sar=01;31" "*.rar=01;31" "*.alz=01;31" "*.ace=01;31" "*.zoo=01;31" "*.cpio=01;31" "*.7z=01;31" "*.rz=01;31" "*.cab=01;31" "*.jpg=01;35" "*.jpeg=01;35" "*.gif=01;35" "*.bmp=01;35" "*.pbm=01;35" "*.pgm=01;35" "*.ppm=01;35" "*.tga=01;35" "*.xbm=01;35" "*.xpm=01;35" "*.tif=01;35" "*.tiff=01;35" "*.png=01;35" "*.svg=01;35" "*.svgz=01;35" "*.mng=01;35" "*.pcx=01;35" "*.mov=01;35" "*.mpg=01;35" "*.mpeg=01;35" "*.m2v=01;35" "*.mkv=01;35" "*.webm=01;35" "*.ogm=01;35" "*.mp4=01;35" "*.m4v=01;35" "*.mp4v=01;35" "*.vob=01;35" "*.qt=01;35" "*.nuv=01;35" "*.wmv=01;35" "*.asf=01;35" "*.rm=01;35" "*.rmvb=01;35" "*.flc=01;35" "*.avi=01;35" "*.fli=01;35" "*.flv=01;35" "*.gl=01;35" "*.dl=01;35" "*.xcf=01;35" "*.xwd=01;35" "*.yuv=01;35" "*.cgm=01;35" "*.emf=01;35" "*.ogv=01;35" "*.ogx=01;35" "*.cfg=00;32" "*.conf=00;32" "*.diff=00;32" "*.doc=00;32" "*.ini=00;32" "*.log=00;32" "*.patch=00;32" "*.pdf=00;32" "*.ps=00;32" "*.tex=00;32" "*.txt=00;32" "*.aac=00;36" "*.au=00;36" "*.flac=00;36" "*.m4a=00;36" "*.mid=00;36" "*.midi=00;36" "*.mka=00;36" "*.mp3=00;36" "*.mpc=00;36" "*.ogg=00;36" "*.ra=00;36" "*.wav=00;36" "*.oga=00;36" "*.opus=00;36" "*.spx=00;36" "*.xspf=00;36"

setopt no_automenu
setopt bashautolist
setopt interactive_comments
setopt histignorespace

export LESSOPEN=""
export FREETYPE_PROPERTIES="truetype:interpreter-version=35"
export TIME_STYLE="long-iso"
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.cfg=00;32:*.conf=00;32:*.diff=00;32:*.doc=00;32:*.ini=00;32:*.log=00;32:*.patch=00;32:*.pdf=00;32:*.ps=00;32:*.tex=00;32:*.txt=00;32:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:';

#export NIX_REMOTE=daemon
test -e ~/.nix-profile/etc/profile.d/nix.sh && source ~/.nix-profile/etc/profile.d/nix.sh
export PATH="${HOME}/.local/sbin:${HOME}/.local/bin:${HOME}/.local/usr/sbin:${HOME}/.local/usr/bin:${HOME}/.nix-profile/bin:${HOME}/.cargo/bin:/usr/games:/usr/games/bin:${PATH}"

export SHELL="$(which zsh)"
export VISUAL="$(which vi)"
export EDITOR="$(which vi)"

export XDG_RUNTIME_DIR=~/.local/run

function lxcrunit()
{
	local image="${1:-images:alpine/edge}"

	lxc exec \
		"$(
			lxc launch -e ${image} 2> /dev/null \
				| perl -ne "m{^Starting (.+)\$} && print \"\$1\\n\"" \
				| head -n 1
		)" \
		-- \
		sh -c "su -l;halt || su -l"
}

function openmux()
{
	test "${#}" -ge 1 || return 1

	readonly name="${1}"
	shift

	tmux new-session -A -s "${name}" "${@}"
}

darwin && export JUMPHOST="jumpblu"
! darwin && export JUMPHOST="shell.cloud.bsocat.net"

gnu && alias ls="ls --color -F"
bsd && alias ls="ls -F"
darwin && alias ls="ls -FG"

gnu && ulimit -v 16777216
gnu && alias grep="grep --color"
gnu && alias cal="cal -m"

freebsd && alias ls="ls -F"
openbsd && test -e "$(which colorls)" && alias ls="$(which colorls) -FG"

darwin && alias clip="pbcopy"
! darwin && alias clip="xclip -in -selection clipboard"

darwin && alias j="ssh -t ${JUMPHOST} -- \"bash -c \\\"tmux -L tmux a || tmux -L tmux new-session -D bash\\\"\""
! darwin && alias j="ssh -t ${JUMPHOST}"

openbsd && alias sudo="doas"

alias xterm="xterm -bg black -fg white"
alias xmpp="openmux xmpp profanity"
alias sumux="sudo tmux new-session -c ~root"
alias clip="xsel -b"
alias mktemp="mktemp -p ${HOME}/.local/tmp"
alias tmp="cd \$(mktemp -d)"
alias work="openmux work"
alias note="cat > /dev/null"

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

