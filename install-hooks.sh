#!/bin/bash

cd .git/hooks
if [ ! -f pre-commit ]; then
	cat << 'EOF' > pre-commit
#!/bin/sh

if nix flake check . ; then
	echo "no language mistakes found."
	echo "moving on to formatting"
else
	echo "Feeeeeehler"
fi

git diff --cached --name-only -- '**.nix' | xargs -r nixfmt
EOF
	chmod +x pre-commit

else
	echo "pre-commit hook already exists. Please delete or add hook content manually"
fi
