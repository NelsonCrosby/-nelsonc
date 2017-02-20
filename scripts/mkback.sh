#!/bin/bash
# vim: set et ts=4 sw=4:

[ -z "$BACKUPOPTS" ] && \
    BACKUPOPTS="( -not -name '*/.*' -o -name '*/.git/*' )"

[ -z "$BACKUPTARGS" ] && \
    BACKUPTARGS="--xz --exclude-vcs-ignores --xattrs --acls"

b_backup () {
    local latestf="$BACKUPDIR/$(ls -c "$BACKUPDIR" | cut -f 1 -d ' ')"
    find . -type f -newercc "$latestf" \( $BACKUPOPTS \) -print0 \
        | xargs -0 tar -c $BACKUPTARGS --file "$BACKUPDIR/$(date '%G-w%V').txz"
}
