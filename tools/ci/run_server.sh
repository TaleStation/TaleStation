#!/bin/bash
set -euo pipefail

tools/deploy.sh ci_test
mkdir ci_test/config

#test config
cp tools/ci/ci_config.txt ci_test/config/config.txt

cd ci_test
<<<<<<< HEAD
DreamDaemon jollystation.dmb -close -trusted -verbose -params "log-directory=ci"
=======
DreamDaemon tgstation.dmb -close -trusted -verbose -params "log-directory=ci"
>>>>>>> b4c08c4bd5e6dd7751287bbd05f6c0fc6e01ff1b
cd ..
cat ci_test/data/logs/ci/clean_run.lk
