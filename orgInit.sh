#!/bin/bash
readonly ALIAS=sot2019-dev
# readonly PERMSET=Sample_App

echo
echo scratch org を作成します ...
sfdx force:org:create -s -f config/project-scratch-def.json -a ${ALIAS}

echo
echo org の一覧を表示します ...
sfdx force:org:list

echo
echo ソースコードを push します ...
sfdx force:source:push

# echo
# echo 権限セットを割り当てます ...
# sfdx force:user:permset:assign -n ${PERMSET}

echo
echo scratch org へアクセスします ...
sfdx force:org:open

echo
echo node_modules を初期化します ...
./runRebuild.sh
