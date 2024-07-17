#!/bin/sh
GIT_USERNAME="$(git config --global user.name)"
GIT_EMAIL="$(git config --global user.email)"
if [ -z "$GIT_USERNAME" ]; then
 	echo "Git user name?"
	read GIT_USERNAME
	git config --global user.name "$GIT_USERNAME"
fi
if [ -z "$GIT_EMAIL" ]; then
 	echo "Git email?"
	read GIT_EMAIL
	git config --global user.email "$GIT_EMAIL"
fi

git config --global alias.lg "log --graph --date-order -C -M --pretty=format:\"%C(224) %h  %an 󰃭 %ad%C(183)%d %C(reset)%s\" --all --date=short"
git config --global alias.open "!f(){ gh repo view -w; }; f"
git config --global alias.branch-name "!git rev-parse --abbrev-ref HEAD"
git config --global alias.uncommit "move-head HEAD^"
git config --global alias.move-head "reset --soft"
git config --global alias.publish '!git push -u origin $(git branch-name)'
git config --global pull.rebase false
git config --global init.defaultBranch "main"
