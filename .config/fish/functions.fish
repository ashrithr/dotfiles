# Functions

function mkd -d 'Create a new directory and enter it'
	mkdir -p $argv && cd $argv
end

function targz -d 'Create a .tar.gz archive, using `zopfli`, `pigz` or `gzip` for compression'
	# set -l tmpFile (basename $argv[1] | string split -r -m1 .)[1]
end
