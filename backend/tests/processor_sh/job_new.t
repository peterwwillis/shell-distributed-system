#!/usr/bin/env sh
# vim: syntax=sh
[ "${DEBUG:-0}" = "1" ] && set -x
set -u

_t_processor_sh_jobs_new_1234 () {
    cd "$tmpdir"
    # This will background a new job, but return before it is run.
    # Must check for the running job to complete, or the background
    # job will just put failure messages into STDERR in the background.
    if ! shds-processor jobs new -r 1234 -- ls -la ; then
        echo "$0: ERROR: failed to start new job"
        return 1
    fi
    # FIXME: this is a hack...
    sleep 5
}


ext_tests="processor_sh_jobs_new_1234"
