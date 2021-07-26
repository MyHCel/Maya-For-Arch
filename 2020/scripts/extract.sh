#!/bin/bash

# extract the compressed file

mkdir Maya
tar zxvf $(ls | grep Maya | grep .tgz) -C Maya
