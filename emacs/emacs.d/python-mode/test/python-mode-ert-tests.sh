#!/bin/bash
 # -- run ert tests in batch mode


# Author: Andreas Roehler <andreas.roehler@online.de>

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
# Commentary:

# This script tests Emacs python-mode.

# Caveats:
#
# needs being started in `test' directory
# optional shell argument PATH/TO/EMACS-SOURCE-DIRECTORY might be given
#
# If testing with emacs-24 please be aware of bug 11984 [0], for the
# time being the patch will need to be added manually.
#
# IPython 0.12 due to a bug in argparse requires a patch [1] to work.
#
# 0. http://debbugs.gnu.org/cgi/bugreport.cgi?bug=11984
# 1. http://bugs.python.org/issue13720

# Code:


# needs being in `test' directory
# PCOT=`pwd`
PCOT="."
# PDIR=".."
PDIR=$(cd ..; pwd)/
# the directory that this file is in.
# TESTDIR="$(dirname "$0")"
# PDIR="$TESTDIR/.."

# write PATH-TO-EMACS source code default directory here
EMACS_SOURCE_DIR="/usr/share/emacs/24.2"
# if [ $1 ]; then
#     echo "\$1: $1"
#     EMACS_SOURCE_DIR=$1
# elif [ -s "$HOME/emacs-23.4" ]; then
#     EMACS_SOURCE_DIR="$HOME/emacs-23.4"
    
    # EMACS_SOURCE_DIR="$HOME/emacs_20130227"
#     else
# cat    <<EOF
# usage: ${0##*/} EMACS_SOURCE_DIR
# 
# This script tests python-mode with non-installed Emacsen in a Bash.
# 
# It assumes being in directory "test" below python-mode.el and relies on source-code directories as delivered by bzr branch.
# 
# Edit \$EMACS_SOURCE_DIR to specify an Emacs or put "PATH-TO-EMACS-SOURCES" as shell argument.
# 
# To run tests with installed Emacs, load available test-files like "py-bug-numbered-tests.el" and do "M-x py-run-bug-numbered-tests". Alternatively you may edit variables making it point according to you installation.
# 
# EOF
# 
# fi

echo "\$EMACS_SOURCE_DIR: $EMACS_SOURCE_DIR"

# EMACS="$EMACS_SOURCE_DIR/src/emacs"
EMACS="/usr/bin/emacs"

# python-mode file to load
if [ -s "../python-components-mode.el" ];
then
    PYTHONMODE="../python-components-mode.el"
elif
    [ -s "../python-mode.el" ];
then
    PYTHONMODE="../python-mode.el"
else
    cat    <<EOF
usage: ${0##*/} EMACS_SOURCE_DIR

This script tests python-mode with non-installed Emacsen in a Bash.

It assumes being in directory "test" below python-mode.el and relies on source-code directories as delivered by bzr branch.

Edit \$EMACS_SOURCE_DIR to specify an Emacs or put "PATH-TO-EMACS-SOURCES" as shell argument.

To run tests with installed Emacs, load available test-files like "py-bug-numbered-tests.el" and do "M-x py-run-bug-numbered-tests". Alternatively you may edit variables making it point according to you installation.

EOF

fi

# edit this to get locally installed stuff loaded
MYEXTENSIONS="${HOME}/arbeit/emacs/elisp"

APAIR="${HOME}/arbeit/emacs/autopair/autopair.el"

if [ -s ${HOME}/.emacs.d/elpa/smart-operator-4.0/smart-operator.elc ];then
    SO="${HOME}/.emacs.d/elpa/smart-operator-4.0/smart-operator.elc"
elif [ -s ${HOME}/.emacs.d/elpa/smart-operator-4.0/smart-operator.el ];then
    SO="${HOME}/.emacs.d/elpa/smart-operator-4.0/smart-operator.el"
else 
    SO="${MYEXTENSIONS}/smart-operator.el"
fi

COLMK="$PDIR/extensions/column-marker.el"
HIGHL="$PDIR/extensions/highlight-indentation.el"

# CLMACS="${EMACS_SOURCE_DIR}/lisp/emacs-lisp/cl-macs.el"
if [ -s "${EMACS_SOURCE_DIR}/lisp/emacs-lisp/cl-macs.elc" ];then
    CLMACS="${EMACS_SOURCE_DIR}/lisp/emacs-lisp/cl-macs.elc"
else
    CLMACS="${EMACS_SOURCE_DIR}/lisp/emacs-lisp/cl-macs.el"
fi

# BYTECOMP="${EMACS_SOURCE_DIR}/lisp/emacs-lisp/bytecomp.el"
if [ -s "${EMACS_SOURCE_DIR}/lisp/emacs-lisp/bytecomp.elc" ];then
    BYTECOMP="${EMACS_SOURCE_DIR}/lisp/emacs-lisp/bytecomp.elc"
else
    BYTECOMP="${EMACS_SOURCE_DIR}/lisp/emacs-lisp/bytecomp.el"
fi

if [ -s "${EMACS_SOURCE_DIR}/lisp/custom.elc" ];then
    CUSTOM="${EMACS_SOURCE_DIR}/lisp/custom.elc"
else
    CUSTOM="${EMACS_SOURCE_DIR}/lisp/comint.el"
fi
 
if [ -s "${EMACS_SOURCE_DIR}/lisp/ansi-color.elc" ];then
    ANSICOLOR="${EMACS_SOURCE_DIR}/lisp/ansi-color.elc"
else
    ANSICOLOR="${EMACS_SOURCE_DIR}/lisp/ansi-color.el"
fi

if [ -s "${EMACS_SOURCE_DIR}/lisp/comint.elc" ]; then
    COMINT="${EMACS_SOURCE_DIR}/lisp/comint.elc"
else
    COMINT="${EMACS_SOURCE_DIR}/lisp/comint.el"
fi

if [ -s "${EMACS_SOURCE_DIR}/lisp/progmodes/cc-cmds.elc" ];then
    CC_CMDS="${EMACS_SOURCE_DIR}/lisp/progmodes/cc-cmds.elc"
else
    CC_CMDS="${EMACS_SOURCE_DIR}/lisp/cc-cmds.el"
fi




# SKEL="${EMACS_SOURCE_DIR}/lisp/skeleton.el"
if [ -s "${EMACS_SOURCE_DIR}/lisp/skeleton.elc" ];then
    SKELETON="${EMACS_SOURCE_DIR}/lisp/skeleton.elc"
else
    SKELETON="${EMACS_SOURCE_DIR}/lisp/skeleton.el"
fi

PYCO="$PDIR/completion/pycomplete.el"


# file holding the tests
TESTFILE="py-bug-numbered-tests.el"
TESTFILE2="python-mode-test.el"
TESTFILE3="python-extended-executes-test.el"
TESTFILE4="python-executes-test.el"
TESTFILE5="py-shell-completion-tests.el"
CEXEC="python-extended-executes.el"
PCOT="$TESTDIR"

# export PYTHONPATH="$PDIR/completion/:~/tmp/"

# python-mode file to load
if [ -s "$PDIR/python-components-mode.el" ];
then
    PYTHONMODE="$PDIR/python-components-mode.el"
else
    PYTHONMODE="$PDIR/python-mode.el"
fi

echo "\$PYMACS: $PYMACS"
echo "\$PYTHONMODE: $PYTHONMODE"
echo "\$PDIR/\$TESTFILE: $PDIR/$TESTFILE"

$EMACS -Q --batch --eval "(message (emacs-version))" --eval "(when (featurep 'python)(unload-feature 'python t))" --eval "(when (featurep 'python-mode)(unload-feature 'python-mode t))" --eval "(add-to-list 'load-path \"$PDIR/\")" --eval "(add-to-list 'load-path \"$TESTDIR/\")" --eval "(setq py-install-directory \"$PDIR\"))" --eval "(message \"py-install-directory: %s\" py-install-directory)" --eval "(setq py-load-pymacs-p nil)" -load $CC_CMDS -load $COMINT -load $ANSICOLOR -load $CLMACS -load $BYTECOMP -load $CUSTOM -load $SKELETON -load $SO -load $COLMK -load $HIGHL -load $PYTHONMODE  --eval "(message \"py-temp-directory: %s\" py-temp-directory)" -load $PCOT$TESTFILE -load $PCOT$TESTFILE2 -load $PCOT$TESTFILE3 -load $PCOT$TESTFILE4 -load $PCOT$TESTFILE5 l ert -l python-mode-ert-tests.el -f ert-run-tests-batch
