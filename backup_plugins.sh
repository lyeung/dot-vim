#!/usr/bin/env bash
for f in ~/.vim/bundle/*
do
  cat $f/.git/config | grep "url" | tr -d '\t ' | cut -d '=' -f2
done
