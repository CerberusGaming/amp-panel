#!/bin/bash
set -e
/opt/cubecoders/amp/ampinstmgr -b 0
exec "$@"
