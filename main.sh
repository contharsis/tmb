#!/bin/bash

# description
# main file, add to be sourced in shell file which is sourced when you initiallize shell environment
# holds mostly user oriented content

# development
# since this is a template, to develop create "dev" directory, add "dev" to .gitignore
# enter "dev" directory, add contents which you've changed (usually from bpm/), gad to add all content from dev, gd to see it and manually add code to its correct place
# open a pull request

# stopper
# to stop this script from executing, export stop_main="true", uncomment next if statement
# if [ "$stop_main" = "true" ]; then
# 	return
# fi

declare bpm="/home/<username>/bpm"

source "${bpm}/lib/pdir.sh"

# clear screen
c() {
	clear
}

# edit .bashrc
eb() {
        vim ~/.bashrc
}

# reload .bashrc
# needs fix, doesn't reset environment (variables, etc.)
rb() {        
	clear
        exec bash
	cd "$cdir"
}

# exit terminal
e() {
	exit
}

# go to home and clear screen
cdc() {
	cd
	c
}

# add library for vector with it's respective functions with functionality like in C++
# add moving library for bash to move to place provided by first argument

# go to <location>
cd<letter>() {
	cd <dir>
	c
}

# launch app
sq<letter>() {
	sqlite3 <path to database>
}

# git climb, go back to root directory of git repo
gcl() {
	cd "$(git rev-parse --show-toplevel)"
}

# git add all from current directory
gal() {
	git add .
}

# git add all from root of repository
gall() {
	set_pdir
	gcl
	gal
	cd "$(get_pdir)"
}

# git push
gpu() {
	git push
}

# git commit with comment which is first argument $1 
gfc() {
	set_pdir
	git commit -m "$1"
	git push
	cd "$(get_pdir)"
}

# git push force, forcely push current state, be careful
gpf() {
	git push --force
}

# fast git push
gf() {
	gfc "Update repository"
}

# git reset to commit, resets staging index
grc() {
	git reset "$1"
}

# git return to local head
grh() {
	grc "HEAD"
}

# git return to remote head
groh() {
	grc "origin/HEAD"
}

# git pull
gp() {
	git pull
}

# git status
gss() {
	c
	git status
}

# show diff with head
gd() {
	c
	gall
	git diff HEAD
}

# same as gd, but doesn't have pager
gdnp() {
	c
	gall
	git --no-pager diff HEAD
}

# unstage whole tree
grt() {
 	set_pdir
	gcl
	git restore --staged .
 	cd "$(get_pdir)"
 }
 
gri() {
	set_pdir
	gcl
	git restore .
	cd "$(get_pdir)"
}

# discard file
grf() {
	git restore --staged --worktree "$1"	
}

# unstage whole tree and discard whole index
grad() {
	grt
	gri
}

# git log
gl() {
	c
	git log
}

# fast local config, first argument is username
gco() {
	git config user.name "$1"
	git config user.email "$1@gmail.com"
}

gcco() {
	printf "username: %s\nemail: %s\n" "$(git config user.name)" "$(git config user.email)"
}
