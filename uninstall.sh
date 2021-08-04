#!/bin/bash

echo -e "HOME_DIR=$HOME" > env.sh
chmod +x env.sh

sudo ./scripts/common/uninstall_all.sh

