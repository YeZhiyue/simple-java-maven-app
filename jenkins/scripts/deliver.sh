#!/usr/bin/env bash

# 第一步：配置我们需要使用的变量
BAK_TIME=`date "+%Y-%m-%d"`
echo '当前时间:'$BAK_TIME''
CURRENT_PATH=`pwd`
echo '当前路径:'$CURRENT_PATH''
# 如果是Docker安装Jenkins，这里就需要配置容器内的路径了
TARGET_PATH='/var/jenkins_home/dev_projects/helloworld'
echo '目标路径:'$TARGET_PATH''
# 当前打包的 jar
CURRENT_JAR=''

# 第二不：打包
mvn install
# 获取打包文件的Name
NAME=`mvn help:evaluate -Dexpression=project.name | grep "^[^\[]"`
# 获取文件的发布版本
VERSION=`mvn help:evaluate -Dexpression=project.version | grep "^[^\[]"`

# 第三步：更新之前的代码仓库
CURRENT_JAR=''${NAME}'-'${VERSION}'.jar'
# 停止原来的项目
pkill -f ''$TARGET_PATH'/'$CURRENT_JAR''
# 删除之前的备份
BACK_FILES=`find ./ -name '*jar.*'`
for i in $BACK_FILES ; do
    echo '删除之前的备份文件:'$i''
    rm $i
done
# 备份原来的文件
mv ''$TARGET_PATH'/'$CURRENT_JAR'' ''$TARGET_PATH'/'$CURRENT_JAR'.'$BAK_TIME'bak'
# 拷贝新的 jar
mv '/target/'$CURRENT_JAR'' $TARGET_PATH
# 启动新的 jar
java -jar ''$TARGET_PATH'/'$CURRENT_JAR''

