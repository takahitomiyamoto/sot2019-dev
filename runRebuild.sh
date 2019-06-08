#!/bin/bash

npm run rebuild

echo
echo 不要なモジュールを削除します ...
rm -rf ./node_modules/svgo/node_modules/js-yaml/
npm dedupe
npm update

echo
echo ... DONE
