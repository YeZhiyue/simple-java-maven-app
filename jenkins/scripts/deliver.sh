#!/usr/bin/env bash

# 定义变量
BAK_TIME=`date "+%Y-%m-%d"`
echo '当前时间:'$BAK_TIME''
CURRENT_PATH=`pwd`
echo '当前路径:'$CURRENT_PATH''
TARGET_PATH='/home/project'
echo '目标路径:'$TARGET_PATH''

# mv /a.md $TARGET_PATH 移动我们的工程到指定的目录下面

# 打包
mvn install
# 获取打包文件的Name
NAME=`mvn help:evaluate -Dexpression=project.name | grep "^[^\[]"`
# 获取文件的发布版本
VERSION=`mvn help:evaluate -Dexpression=project.version | grep "^[^\[]"`
#
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
mv 'target/'$CURRENT_JAR'' $TARGET_PATH
# 启动新的 jar
java -jar ''$TARGET_PATH'/'$CURRENT_JAR''

