rm -rf * .git
echo "$(pwd)"
echo "$WORKSPACE"
# cd ..
git clone https://${userName}:${GitHubToken}@github.com/${owner}/${repository}.git .
# cd ${repository}
git checkout ${branch}
ls -la
echo "$(pwd)"
echo "$(WORKSPACE)"
