#! /bin/bash
# vim: ai et sts=4 sw=4

# Get a root login shell that preserves ssh-agent connectivity.
#
# 20060615: The script used to be based on sudo su - -c 'bash ...'
# but FC5's version of su has some strange tty handling when running
# -c, such that pressing CTRL-C in the subshell would terminate the
# parent.  It's not immediately clear how to fix this so instead
# this script directly invokes bash -i.

exec sudo env \
        SSH_AUTH_SOCK="$SSH_AUTH_SOCK" \
        SSH_CLIENT="$SSH_CLIENT" \
        SSH_CONNECTION="$SSH_CONNECTION" \
        SSH_TTY="$SSH_TTY" \
    bash --rcfile $HOME/.root_bashrc -i
