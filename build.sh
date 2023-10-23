#!/bin/sh
PGSQL=/usr
MATCHES=(/usr/pgsql-*)
if [[ ${#MATCHES[@]} -gt 0 ]] ; then
  CNT=${#MATCHES[@]}
  PGSQL=${MATCHES[$CNT-1]}
  PG_VERSION=${PGSQL##*-}
fi

env PG_CONFIG=/usr/pgsql-$PG_VERSION/bin/pg_config rpmbuild --define 'dist .apnscp' --define "_topdir `pwd`" -ba SPECS/dovecot.spec
