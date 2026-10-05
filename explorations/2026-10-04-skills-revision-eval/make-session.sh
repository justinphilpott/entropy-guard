#!/usr/bin/env bash
# Builds one constructed ORC session for the R4 guard runs of the 2026-10-04 skills test.
#
# Usage: make-session.sh <orc-snapshot> <lab-snapshot> <out-dir> <a|b>
#   <orc-snapshot>  ORC at 8cee662, unpacked without .git (git -C orchestrator archive 8cee662 | tar -x)
#   <lab-snapshot>  scope-orchestration-lab at 096b96f, unpacked the same way
#   <out-dir>       where to build the session; it is deleted and recreated
#   a               one committed legitimate change (a loop variable renamed)
#   b               the same commit, plus an uncommitted rename of ORCHESTRATOR_SCOPE_DIRECTORIES that leaves
#                   README.md line 81 naming the old setting
set -euo pipefail
ORC=$1; LAB=$2; D=$3; scen=$4
export GIT_AUTHOR_NAME=Eval-Fixture GIT_AUTHOR_EMAIL=fixture@example.invalid \
       GIT_COMMITTER_NAME=Eval-Fixture GIT_COMMITTER_EMAIL=fixture@example.invalid
rm -rf "$D"; mkdir -p "$D"
cp -a "$ORC" "$D/orchestrator"; cp -a "$LAB" "$D/scope-orchestration-lab"
cd "$D/orchestrator"
git init -q -b main; git add -A; git commit -q -m "ORC at 8cee662"
git clone -q --bare . ../origin.git; git remote add origin ../origin.git; git fetch -q origin
git branch -q -u origin/main main
git switch -q -c session
python3 - <<'PY'
p = 'src/agent-discovery.ts'; s = open(p).read()
old = 'for (const entry of value.split(",")) {\n    const directory = entry.trim();'
assert s.count(old) == 1
open(p, 'w').write(s.replace(old, 'for (const part of value.split(",")) {\n    const directory = part.trim();'))
PY
git commit -q -am "Rename a loop variable in parseScopeDirectories"
if [ "$scen" = b ]; then
  sed -i 's/export const SCOPE_DIRECTORIES_ENVIRONMENT = "ORCHESTRATOR_SCOPE_DIRECTORIES";/export const SCOPE_DIRECTORIES_ENVIRONMENT = "ORCHESTRATOR_SCOPE_DIRS";/' src/agent-discovery.ts
  sed -i 's/vi.stubEnv("ORCHESTRATOR_SCOPE_DIRECTORIES", scope);/vi.stubEnv("ORCHESTRATOR_SCOPE_DIRS", scope);/' test/production-composition.acceptance.test.ts
fi
git log --oneline -2; git status --short
