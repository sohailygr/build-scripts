#/bin/bash -e
source ./step-set-config-params.sh
echo Changing directory to ${WORK_DIR}
cd ${WORK_DIR}
echo Removing directory adobe
rm -fR adobe
echo git clone "${ADOBE_GIT_URL}" adobe 
git clone "${ADOBE_GIT_URL}" adobe 
if [ $? -ne 0 ]; then 
    echo git subtree add --prefix ${gitRepo}  "${MCAFEE_REPO_BASE_PATH}${gitRepo}.git" ${branchName} --squash failed
    exit 1
fi 
cd adobe 
echo git remote add mcafee ../mcafee/.git
git remote add mcafee ../mcafee/.git
if [ $? -ne 0 ]; then 
    echo git remote add mcafee ../mcafee/.git
    exit 1
fi 
git fetch mcafee
if [ $? -ne 0 ]; then 
    echo git fetch mcafee
    exit 1
fi 
git reset --hard mcafee/master
if [ $? -ne 0 ]; then 
    echo git reset --hard mcafee/master
    exit 1
fi 
git clean -f -d 
if [ $? -ne 0 ]; then 
    echo git clean -f -d 
    exit 1
fi 
#git pull -f --allow-unrelated-histories 
#if [ $? -ne 0 ]; then 
#    echo pull -f --allow-unrelated-histories 
#    exit 1
#fi 
git push -f origin main
if [ $? -ne 0 ]; then 
    echo git push -f origin main
    exit 1
fi 