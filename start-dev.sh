#!/bin/bash

set -eu

options=$(getopt -o c,d: -l create-vm,destroy-vm -- "$@") || exit
eval set -- "$options"

DELETE_VM='false'
RUN_VM='true'

while [[ $1 != -- ]]; do
  case $1 in
    -c|--create-vm)
      DELETE_VM='true';
      shift 1;;

    -d|--destroy-vm)
      DELETE_VM='true';
      RUN_VM='false';
      shift 1;;

    *)
      echo "bad option: $1" >&2;
      exit 1;;
  esac
done

shift

cd infra

if ${DELETE_VM}; then
  (
    cd vagrant;
    vagrant destroy --no-tty --parallel --force;
  )
fi

if ${RUN_VM}; then
  (
    cd vagrant;
    vagrant up --parallel --destroy-on-error;
  )

  (
    cd ansible;
    ansible-galaxy install -r ./requirements.yml
    ansible-playbook ./configure.yml -i ./inventory/local/hosts.ini
  )
fi
