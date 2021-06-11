#!/bin/bash
echo "docker run -v $(pwd)/..:/tmp/quantumx-installer $IMAGE /tmp/quantumx-installer/quantumx-installer/test/test.sh"
docker run -e IMAGE=$IMAGE -v $(pwd)/..:/tmp/quantumx-installer $IMAGE /tmp/quantumx-installer/quantumx-installer/test/test.sh 2>&1 | tee /tmp/$$.log
if grep -q "required envvar" /tmp/$$.log; then
    echo "Success"
    exit 0
fi
exit 1
