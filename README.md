# FlutterTraining

## GIT FLOW RULES
A clean and consistent Git flow improves teamwork and tracking.

### Task branch
*Create branch:*
```bash
git checkout -b name_branch
```
  *Example*
```bash
 git checkout -b task/01_Learing_Github
```
*Check for changed files:*
```bash
 git status
```
*Add all files changed:*
```bash
git add .
```
*Commit message format:*
```bash
git commit -m "[Task] Capitalized short description"
```
*Exmaple*
```bash
git commit -m "[Task] Learning Github"
```
*Update last commit desciptions:*
```bash
git commit --amend -m "[Task] Capitalized short description"
```
*Exmaple*
```bash
git commit --amend -m "[Task] Learning Github"
```
*Git merge*
- Used to merge two branches by creating a new merge commit

*Example*
```bash
git checkout master
```
```bash
git merge task/01_Learing_Github
```
*Git rebase*
Move commits from the current branch onto the base branch.
*Example*
```bash
git rebase task/01_Learing_Github
```
*Push/Pull*
- push code to github
```bash
git push origin name_branch
```
*Example*
```bash
git push origin task/01_Learing_Github
```
- If you want the remote branch to overwrite by your branch 
```bash
git push --force origin task/01_Learing_Github
```
*Fix conflict*
- The most direct way to resolve a merge conflict is to edit the conflicted file and run .
```bash
git commit 
```
Unmerged paths after fix conflict then run
```bash
git add name_file
```
*Example*
```bash
git add README.md
```
- To abort the merge when have conflict
```bash
  git merge --abort
```
-  To reset conflicted files to a know good state
```bash
  git reset
```
  





