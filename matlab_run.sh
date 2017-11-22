#!/bin/bash
if [ $# -ne 1 ]; then
    echo "<usage> $0  <file_m_to_run>"
    exit 2
fi
matlab -nojvm -nosplash -nodisplay -nodesktop -r "run $1; exit"
