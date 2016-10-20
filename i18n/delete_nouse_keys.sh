#!/bin/bash

grep id messages-ja.xtb | awk '{print $2}' | sort > ja_ids
grep id messages-en.xtb | awk '{print $2}' | sort > en_ids
diff en_ids ja_ids | grep id | awk '{print $2}' > nouse_ids

while read id; do
  sed -i "/${id}/d" messages-ja.xtb
done < nouse_ids  
