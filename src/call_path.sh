#!/usr/bin/env bash
. "$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/path.sh"
echo "SelfPath    : $(SelfPath)"
echo "SelfName    : $(SelfName)"
echo "SelfExt     : $(SelfExt)"
echo "SelfNameId  : $(SelfNameId)"

echo "CallerPath  : $(CallerPath)"
echo "CallerName  : $(CallerName)"
echo "CallerExt   : $(CallerExt)"
echo "CallerNameId: $(CallerNameId)"
