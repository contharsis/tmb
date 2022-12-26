#!/bin/bash

declare pdir

set_pdir() {
	pdir="$(pwd)"
}

get_pdir() {
	echo "$pdir"
}
