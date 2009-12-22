#!/bin/sh

TEMPLATE=/srv/http/error

sed -e "s,___REASON___,$1," $TEMPLATE
