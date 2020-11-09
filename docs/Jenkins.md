
## 测试用例

*<a href="#_top" rel="nofollow" target="_self">返回目录</a>*

测试Gitee：https://gitee.com/YeZhiyueGitee/myexcel.git

## Docker安装启动

*<a href="#_top" rel="nofollow" target="_self">返回目录</a>*

```java
docker run \
  -u root \
  --rm \
  -d \
  -p 8080:8080 \
  -p 50000:50000 \
  -v /home/jenkins:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  jenkinsci/blueocean
```

进入后台

```java
docker exec -it jenkins-tutorials bash
```

## 初始密码

*<a href="#_top" rel="nofollow" target="_self">返回目录</a>*

```java
/jenkins/secrets/initialAdminPassword
```

## 配置中文插件

*<a href="#_top" rel="nofollow" target="_self">返回目录</a>*

[博客地址](https://www.cnblogs.com/EasonJim/p/6373769.html)

安装插件然后配置语言即可：Locale plugin 

## 开发环境搭建

*<a href="#_top" rel="nofollow" target="_self">返回目录</a>*

### Git

```java
yum -y install git
```

```java
git --version
```

### Maven

```java
wget https://mirrors.aliyun.com/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.zip
```

```java
unzip apache-maven-3.6.3-bin.zip 
```

```java
vi /etc/profile
```

```java
source /etc/profile
```

```java
mvn -v 
```

### JDK8

```java
wget https://repo.huaweicloud.com/java/jdk/8u151-b12/jdk-8u151-linux-x64.tar.gz
```

```java
tar -zxvf jdk-8u151-linux-x64.tar.gz
```

```java
vi /etc/profile
```

```java
set java environment
JAVA_HOME=/home/mysoft/java/jdk1.8.0_151
JRE_HOME=/home/mysoft/java/jdk1.8.0_151/jre
CLASS_PATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib
PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin
export JAVA_HOME JRE_HOME CLASS_PATH PATH
```

```java
source /etc/profile
```

```java
java -version
```

## 示例

*<a href="#_top" rel="nofollow" target="_self">返回目录</a>*


一探究竟，Jenkins运行指令的目录是在你当前pull下来的Git目录下面。所以，你如果需要运行.sh脚本的话就需要注意了

```java
/var/jenkins_home/workspace/simple-java-maven-app3_master
```