#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e87b37aa6fa990014a2181d/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e87b37aa6fa990014a2181d
curl -s -X POST https://api.stackbit.com/project/5e87b37aa6fa990014a2181d/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e87b37aa6fa990014a2181d/webhook/build/publish > /dev/null
