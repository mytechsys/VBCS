git clone https://98608225-ora030@appdevcs98608225-ocuocictrng29-iad.developer.ocp.oraclecloud.com/appdevcs98608225-ocuocictrng29-iad/s/appdevcs98608225-ocuocictrng29-iad_project_113124/scm/fileloader-csv-2510.git .
git checkout dev

git remote add "GitHub" https://gokulakishorereddypuli:${GithubToken}@github.com/gokulakishorereddypuli/fileloader-csv-2510.git
git fetch GitHub dev
git pull --no-rebase GitHub dev --allow-unrelated-histories
git fetch GitHub --tags --force
git push GitHub dev
git push GitHub --tags
