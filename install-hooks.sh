#!/bin/bash

cd .git/hooks
if [ ! -f pre-commit ]; then
	cat << 'EOF' > pre-commit
#!/bin/sh

EOF
	chmod +x pre-commit

else
	echo "pre-commit hook already exists. Please delete or add hook content manually"
