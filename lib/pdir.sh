#!/bin/bash

# library used save current directory and move into it later

declare pdir

set_pdir() {
	pdir="$(pwd)"
}

get_pdir() {
	echo "$pdir"
}
