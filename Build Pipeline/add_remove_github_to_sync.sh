git checkout dev
git remote add "GitHub" https://gokulakishorereddypuli:${GithubToken}@github.com/gokulakishorereddypuli/webapp.git
git config pull.rebase false
# git fetch GitHub
# git merge GitHub/dev --allow-unrelated-histories -m "Sync from Github"
git pull GitHub dev --allow-unrelated-histories
git push GitHub dev
