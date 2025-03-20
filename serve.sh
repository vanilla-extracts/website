#!/bin/sh
set -e
cd "$(dirname "$0")"
exec ./build --features server -- --serve-port 8088 --drafts --no-icons
