#!/usr/bin/env bash
SelfPath() { echo "$(__Join "$(SelfParent)" "$(SelfName)")"; }
SelfParent() { echo "$(__Parent "${BASH_SOURCE:-0}")"; }
SelfName() { echo "$(__Name "${BASH_SOURCE:-0}")"; }
SelfExt() { echo "$(__Ext "${BASH_SOURCE:-0}")"; }
SelfNameId() { echo "$(__NameId "${BASH_SOURCE:-0}")"; } # WithoutExt

CallerPath() { echo "$(__Join "$(CallerParent)" "$(CallerName)")"; }
CallerParent() { echo "$(__Parent "$0")"; }
CallerName() { echo "$(__Name "$0")"; }
CallerExt() { echo "$(__Ext "$0")"; }
CallerNameId() { echo "$(__NameId "$0")"; } # WithoutExt

__Join() { args=("$@"); echo "$(IFS=/; echo "${args[*]}")"; }
__Parent() { echo "$(cd "$(dirname "$1")"; pwd)"; }
__Name() { echo "$(basename "$1")"; }
__Ext() { local n="$(__Name $1)"; echo "${n##*.}"; }
__NameId() { local n="$(__Name $1)"; echo "${n%.*}"; }
