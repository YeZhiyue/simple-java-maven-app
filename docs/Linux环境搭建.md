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
