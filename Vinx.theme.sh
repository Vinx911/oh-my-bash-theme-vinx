#!/usr/bin/env bash

# prompt themeing

#added TITLEBAR for updating the tab and window titles with the pwd
case $TERM in
	xterm*)
	TITLEBAR="\[\033]0;\u@\h:\w\007\]"
	;;
	*)
	TITLEBAR=""
	;;
esac

function prompt_command() {
	PS1="${TITLEBAR}${bold_green}\u${bold_cyan}@${bold_green}\h  ${bold_cyan}\w $(scm_prompt_info)
${bold_blue}$ ${normal}${reset_color}"
}

# scm themeing
SCM_THEME_PROMPT_DIRTY="${bold_blue}) ${bold_yellow}✗${reset_color}"
SCM_THEME_PROMPT_CLEAN="${bold_blue}) ${bold_yellow}✓${reset_color}"
SCM_THEME_PROMPT_PREFIX="${bold_blue}git:(${bold_red}"
SCM_THEME_PROMPT_SUFFIX="${reset_color}"

safe_append_prompt_command prompt_command
