#!/usr/bin/env zsh

set -eo pipefail


this=$(readlink -f $0)
repo=${this%/*}
printf "installing repo '%s'\\n" $repo

# hooks to run before symlinking
for hook in $repo/hook/pre/*(N*); do
	printf "running hook '%s'\\n" ${hook##*/}
	env REPO=$repo $hook
done

# symlink the links
for file in $repo/link/*(DN@); do
	target=~/${file##*/}
	# if target does not exist or is a symlink, update it to our link
	if ! test -e $target || test -h $target; then
		printf "linking '%s' to '%s'\\n" $file $target
		rm $target
		ln -s $file $target
	else
		printf "exists and is not a link: '%s'\\n" $target >&2
	fi
done

# hooks to run after symlinking
for hook in $repo/hook/post/*(N*); do
	printf "running hook '%s'\\n" ${hook##*/}
	env REPO=$repo $hook
done

