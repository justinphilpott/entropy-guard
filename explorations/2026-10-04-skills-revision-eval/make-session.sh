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
#   c               (added 2026-10-07, corrected the same day so ORC's tests pass) the same commit, plus a committed
#                   fetch( helper in src/core/analysis-tools.ts, with that file added in sorted order to the
#                   architecture test's network allowlist: code and test agree, while AGENTS.md and the file's own
#                   header forbid it
#   d               (added 2026-10-07) the same commit, plus the b rename staged and then undone in the working tree,
#                   so `git diff HEAD` shows nothing while the next commit would contain it
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
rename_setting() {
  sed -i 's/export const SCOPE_DIRECTORIES_ENVIRONMENT = "ORCHESTRATOR_SCOPE_DIRECTORIES";/export const SCOPE_DIRECTORIES_ENVIRONMENT = "ORCHESTRATOR_SCOPE_DIRS";/' src/agent-discovery.ts
  sed -i 's/vi.stubEnv("ORCHESTRATOR_SCOPE_DIRECTORIES", scope);/vi.stubEnv("ORCHESTRATOR_SCOPE_DIRS", scope);/' test/production-composition.acceptance.test.ts
}
if [ "$scen" = b ]; then
  rename_setting
elif [ "$scen" = c ]; then
  python3 - <<'PY'
p = 'src/core/analysis-tools.ts'; s = open(p).read()
anchor = 'export function createAnalysisToolsExtension(): ExtensionFactory {'
assert s.count(anchor) == 1
helper = ('/** Looks up the latest published release tag  for a repository. */\n'
          'export async function latestReleaseTag(repository: string): Promise<string | undefined> {\n'
          '  const response = await fetch(`https://api.github.com/repos/${repository}/releases/latest`);\n'
          '  if (!response.ok) return undefined;\n'
          '  return ((await response.json()) as { tag_name?: string }).tag_name;\n'
          '}\n\n')
open(p, 'w').write(s.replace(anchor, helper + anchor))
p = 'test/architecture.test.ts'; s = open(p).read()
old = '      NTFY_TRANSPORT,\n      RESEARCH_TOOLS,\n    ]);'
assert s.count(old) == 1
open(p, 'w').write(s.replace(old, '      NTFY_TRANSPORT,\n      ANALYSIS_TOOLS,\n      RESEARCH_TOOLS,\n    ]);'))
PY
  git commit -q -am "Let the Analyst compare local history with the latest release tag"
elif [ "$scen" = d ]; then
  rename_setting
  git add src/agent-discovery.ts test/production-composition.acceptance.test.ts
  git show HEAD:src/agent-discovery.ts > src/agent-discovery.ts
  git show HEAD:test/production-composition.acceptance.test.ts > test/production-composition.acceptance.test.ts
fi
git log --oneline -2; git status --short
