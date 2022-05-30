#Configuration Parameters
# These must be passed through the CI/CD tool
# - Be very careful as the code will try to clean this directory
WORK_DIR=`pwd`
ADOBE_GIT_URL=https://${ADOBE_GIT_USERNAME}:${ADOBE_GIT_PASSWORD}@git.cloudmanager.adobe.com/mcafeeinc/${ADOBE_GIT_REPO}
ADOBE_GIT_USERNAME=${ADOBE_GIT_USERNAME}
ADOBE_GIT_PASSWORD=${ADOBE_GIT_PASSWORD}
MCAFEE_REPO_LIST=${MCAFEE_REPO_LIST} 
MCAFEE_REPO_BASE_PATH=https://github.com/sohailygr/
# *** Configuration ***
echo WORK_DIR=${WORK_DIR}
echo ADOBE_GIT_URL=${ADOBE_GIT_URL}
echo ADOBE_GIT_USERNAME=${ADOBE_GIT_USERNAME}
echo ADOBE_GIT_PASSWORD=${ADOBE_GIT_PASSWORD}
echo MCAFEE_REPO_LIST=${MCAFEE_REPO_LIST}
echo MCAFEE_REPO_BASE_PATH=${MCAFEE_REPO_BASE_PATH}
