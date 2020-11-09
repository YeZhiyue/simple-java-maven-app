<font color=#ca0c16 size=8> JenKins搭建并且运行基础示例(基于Docker)

<a id="_top"></a>

@[TOC](文章目录)

# 前言

<font color=#999AAA > JenKins持续性集成，自动化部署，减少了人力成本，并且一次配置好了以后可以减少部署环节中的出错几率。当然，这个教程需要你了解Docker和一些基本的Linux命令。

[官方文档](https://www.jenkins.io/zh/doc/tutorials/build-a-java-app-with-maven/)


---

# 安装启动Jenkins

## 安装

*<a href="#_top" rel="nofollow" target="_self">返回目录</a>*


**说明：**官方推荐 jenkinsci/blueocean 镜像，操作起来更加简单方便

**下面的命令简单解释：**

- 配置了在后台运行
- 配置了端口映射，这里你可以自行进行设置
- 配置了分卷映射，方便我们修改配置和在本机看日志文件

```java
docker run \
  -u root \
  --rm \
  -d \
  -p 8080:8080 \
  -p 50000:50000 \
  -v /home/jenkins:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /home/jenkins:/home \ 
  jenkinsci/blueocean
```

**如果你需要进入容器内部查看文件，可以运行下面的命令**

```java
docker exec -it jenkins-tutorials bash
```

## 进入界面进行配置

*<a href="#_top" rel="nofollow" target="_self">返回目录</a>*

**初始密码获取**

```java
/jenkins/secrets/initialAdminPassword
```

**配置中文插件**

[博客地址](https://www.cnblogs.com/EasonJim/p/6373769.html)

安装插件然后配置语言即可：Locale plugin 

---

# 简单示例

## 示例代码获取

*<a href="#_top" rel="nofollow" target="_self">返回目录</a>*

**1. 拉取官方示例代码**

```java
git clone https://github.com/jenkins-docs/simple-java-maven-app.git
```

**2. 在本地运行然后push到自己的GitHub仓库上面**

并且在自己项目的根目录下面创建名字为 **Jenkinsfile** 的文件

```java
pipeline {
    agent {
        docker {
            image 'maven:3-alpine'
            args '-v /root/.m2:/root/.m2'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Deliver') {
            steps {
                echo 'Jenkins YeZhiyue'
                sh 'pwd'
                sh './jenkins/scripts/deliver.sh'
            }
        }
    }
}
```

**3. 运行你的Jenkins来进行流水线构建**

![](http://img.yhzcmxq.cn/picgo/20201109170927.png)

![](http://img.yhzcmxq.cn/picgo/20201109170958.png)

![](http://img.yhzcmxq.cn/picgo/20201109171028.png)

![](http://img.yhzcmxq.cn/picgo/20201109171154.png)

运行成功

![](http://img.yhzcmxq.cn/picgo/20201109171235.png)
