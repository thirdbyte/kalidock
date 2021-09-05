tmpdir=$(mktemp -d) &>/dev/null; git clone http://github.com/thirdbyte/kalidock $tmpdir &>/dev/null; cd $tmpdir &>/dev/null; bash install.sh; rm -rf $tmpdir &>/dev/null
