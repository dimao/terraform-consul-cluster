#! /bin/bash
BOOTSTRAP_SALT_CHECKSUM='23728e4b5e54f564062070e3be53c5602b55c24c9a76671968abbf3d609258cb'
SALT_VERSION='v2019.2.0'

curl -o bootstrap-salt.sh -L https://bootstrap.saltstack.com
echo "$BOOTSTRAP_SALT_CHECKSUM bootstrap-salt.sh" | sha256sum -c
if [ $? != 0 ]; then
  echo 'bootstrap-salt checksum is not valid'
  exit 1
fi

sh bootstrap-salt.sh git $SALT_VERSION
salt-call state.highstate

