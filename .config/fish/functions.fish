# Functions

function mkd -d 'Create a new directory and enter it'
	mkdir -p $argv && cd $argv
end

function fuck -d 'Correct your previous console command'
    set -l exit_code $status
    set -l eval_script (mktemp 2>/dev/null ; or mktemp -t 'thefuck')
    set -l fucked_up_commandd $history[1]
    thefuck $fucked_up_commandd > $eval_script
    . $eval_script
    rm $eval_script
    if test $exit_code -ne 0
        history --delete $fucked_up_commandd
    end
end

# `shellswitch [bash|zsh|fish]`
function shellswitch
	chsh -s (brew --prefix)/bin/$argv
end

function targz -d 'Create a .tar.gz archive, using `zopfli`, `pigz` or `gzip` for compression'
	# set -l tmpFile (basename $argv[1] | string split -r -m1 .)[1]
end
