tmpdir=$(mktemp -d) && git clone http://github.com/thirdbyte/kalidock $tmpdir && cd $tmpdir && bash install.sh && rm -rf $tmpdir
