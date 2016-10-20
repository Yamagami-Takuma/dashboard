#!/bin/bash

grep id messages-ja.xtb | awk '{print $2}' | sort > ja_ids
grep id messages-en.xtb | awk '{print $2}' | sort > en_ids
diff ja_ids en_ids
rm ja_ids en_ids
