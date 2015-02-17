#!/bin/bash 

ErrorHandler () {
    exit 1
}
trap ErrorHandler ERR

echo executing...
for f in *.bin; do [ ! -e "$f" ] && echo || [[ ! $f == *"server"* ]] && [[ ! $f == *"bench"* ]] && echo simkeypresses | ./$f ; done
