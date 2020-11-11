
## 查看Maven版本

*<a href="#_top" rel="nofollow" target="_self">返回目录</a>*


```java
mvn --version
```

## 基本构建命令

*<a href="#_top" rel="nofollow" target="_self">返回目录</a>*

- clean   清楚构建打包文件
- compile 构建但是不会打包
- package 打包但是不会发布到仓库
- install 打包并且发布到仓库
- test

## 构建多模块

*<a href="#_top" rel="nofollow" target="_self">返回目录</a>*

需要在的 parent 中修改打包方式为 pom 

```maven
+- pom.xml
 +- my-app
 | +- pom.xml
 | +- src
 |   +- main
 |     +- java
 +- my-webapp
 | +- pom.xml
 | +- src
 |   +- main
 |     +- webapp
```

```maven
 <project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
   <modelVersion>4.0.0</modelVersion>
  
   <groupId>com.mycompany.app</groupId>
   <artifactId>app</artifactId>
   <version>1.0-SNAPSHOT</version>
   <packaging>pom</packaging>
  
   <modules>
     <module>my-app</module>
     <module>my-webapp</module>
   </modules>
 </project>
```


