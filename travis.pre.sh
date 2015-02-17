#!/bin/bash 

ErrorHandler () {
    exit 1
}
trap ErrorHandler ERR

echo pre-installing...
