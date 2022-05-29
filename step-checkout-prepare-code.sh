#!/bin/bash -e
source ./step-set-config-params.sh

cd $WORK_DIR
# Clone Adobe Repository into adobe
# Create a bare minimum mcafee git
echo Removing directory mcafee 
rm -fR mcafee
git init mcafee
if [ $? -ne 0 ]; then 
    echo git subtree add --prefix ${gitRepo}  "${MCAFEE_REPO_BASE_PATH}${gitRepo}.git" ${branchName} --squash failed
    exit 1
fi 
cd mcafee
#Create the POM.XML
touch pom.xml
git add pom.xml
git commit -m "First Commit"
modules=""
for val in ${MCAFEE_REPO_LIST}
do    
    #echo $val
    IFS='@'
    read -ra arr <<< "$val"    
    gitRepo=${arr[0]}
    branchName=${arr[1]}
    gitRepoPath=${MCAFEE_REPO_BASE_PATH}${gitRepo}.git
    modules="${modules}<module>${gitRepo}</module>"
    echo "${MCAFEE_REPO_BASE_PATH}"
    echo $modules

    git subtree add --prefix ${gitRepo}  "${MCAFEE_REPO_BASE_PATH}${gitRepo}.git" ${branchName} --squash 
    if [ $? -ne 0 ]; then 
        echo git subtree add --prefix ${gitRepo}  "${MCAFEE_REPO_BASE_PATH}${gitRepo}.git" ${branchName} --squash failed
        exit 1
    fi 
done
tee -a pom.xml <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <groupId>customer.group.id</groupId>
    <artifactId>customer-reactor</artifactId>
    <version>0.0.1-SNAPSHOT</version>
    <packaging>pom</packaging>
    <modules>${modules}</modules>
    </project>
EOF
git add pom.xml
git commit -m "First Commit"
