#!/bin/bash

while [ 1 ]; do curl -sS --insecure "https://127.0.0.1/index.php?login=admin&password=megansapass" 2>&1 > /dev/null; done

