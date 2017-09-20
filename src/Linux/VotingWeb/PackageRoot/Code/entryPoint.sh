#!/usr/bin/env bash
check_errs()
{
  # Function. Parameter 1 is the return code
  if [ "${1}" -ne "0" ]; then
    # make our script exit with the right error code.
    exit ${1}
  fi
}

DIR=`dirname $0`
LogFile="/tmp/VotingWeb-`date '+%Y.%m.%d-%H.%M.%S'`.log"
echo $DIR >$LogFile
echo 0x3f > /proc/self/coredump_filter
dotnet $DIR/VotingWeb.dll $@ >$LogFile 2>&1
check_errs $?