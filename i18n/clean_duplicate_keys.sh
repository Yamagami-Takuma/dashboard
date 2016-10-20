#!/bin/bash

grep id messages-ja.xtb | awk '{print $2}' | sort | uniq -d > duplicate_ids

while read id; do
  grep -n ${id} messages-ja.xtb | awk '{print $1}' | sed -e '$d' | sed -e 's/://g' | sort -r > duplicate_line_nos
  while read line; do
    sed -i "${line}d" messages-ja.xtb
  done < duplicate_line_nos
done < duplicate_ids

rm duplicate_line_nos
