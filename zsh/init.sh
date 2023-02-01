#!/usr/bin/env bash
cat <<EOF > ${HOME}/.sifr0x_tooling
export TOOLING_BASE_DIR="$(pwd)"
EOF

source ${HOME}/.sifr0x_tooling
cat <<EOF >> ${HOME}/.zshrc
source ${HOME}/.sifr0x_tooling
source ${TOOLING_BASE_DIR}/zsh/environment.sh
EOF
