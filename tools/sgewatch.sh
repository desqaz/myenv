#! /bin/bash -i

s sge
export SGE_LONG_QNAMES=1
watch -n 1 qstat
