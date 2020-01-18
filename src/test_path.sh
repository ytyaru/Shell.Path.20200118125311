#!/usr/bin/env bash
. "$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/path.sh"
assert() {
	let ++TEST_NUM
	local expected=$1
	local actual=$2
	[ "$expected" != "$actual" ] && { echo "Failed test... LINENO=$BASH_LINENO TEST_NUM=$TEST_NUM expected='${expected}', actual='${actual}'"; exit 1; }
}
init() {
	TEST_NUM=0
	# expecteds
	CALLER_NAME="$(basename "${BASH_SOURCE:-$0}")"
	CALLER_PARENT="$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)"
	CALLER_PATH="$CALLER_PARENT/$CALLER_NAME"
	CALLER_EXT="${CALLER_NAME##*.}"
	CALLER_NAME_ID="${CALLER_NAME%.*}"
	SELF_NAME="path.sh"
	SELF_PARENT="$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)"
	SELF_PATH="$SELF_PARENT/$SELF_NAME"
	SELF_EXT="sh"
	SELF_NAME_ID="path"
}
fin() { echo "Cleared all test. $TEST_NUM"; }
init

assert "$SELF_PATH"    "$(SelfPath)"
assert "$SELF_PARENT"  "$(SelfParent)"
assert "$SELF_NAME"    "$(SelfName)"
assert "$SELF_EXT"     "$(SelfExt)"
assert "$SELF_NAME_ID" "$(SelfNameId)"

assert "$CALLER_PATH"    "$(CallerPath)"
assert "$CALLER_PARENT"  "$(CallerParent)"
assert "$CALLER_NAME"    "$(CallerName)"
assert "$CALLER_EXT"     "$(CallerExt)"
assert "$CALLER_NAME_ID" "$(CallerNameId)"

assert 'A/B/C' "$(__Join A B C)"
assert 'A B/C' "$(__Join 'A B' 'C')"
assert 'A B C' "$(__Join 'A B C')"
assert '' "$(__Join)"
assert ' ' "$(__Join ' ' )"
assert ' /A/ /B/ ' "$(__Join ' ' 'A' ' ' 'B' ' ')"
mkdir -p /tmp/work
assert "$CALLER_PARENT" "$(__Parent ${BASH_SOURCE:-$0})"
assert "$CALLER_NAME" "$(__Name "$CALLER_PATH")"
assert "$CALLER_EXT" "$(__Ext "$CALLER_PATH")"
assert "$CALLER_NAME_ID" "$(__NameId "$CALLER_PATH")"

fin

