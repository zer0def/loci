#!/bin/bash

set -ex

packages=$@

pip install --no-cache-dir ${PIP_ARGS} ${packages}
