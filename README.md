## docker-jpetstore-wlp

这是一个简单的 Java 的单体 MVC 架构的应用程序，是一个宠物商城的网站，源代码在这里：[MyBatis JPetStore](https://github.com/mybatis/jpetstore-6) ，这个项目是把他做了修改，放到 Docker 里面运行，比较适合做 Docker 的 Demo 演示

This is essentially a fork of [MyBatis JPetStore](https://github.com/mybatis/jpetstore-6) but the application is shipped as a Docker image and runs on [WebSphere Liberty](https://hub.docker.com/_/websphere-liberty/). The unpackaged source code is provided for reference. The Docker image builds using the WAR file.

### 目录结构

* /JPetStore : 是编译之后的整个 war 包的目录，是编译后的结果，整个工程没有代码编译的过程，只有打包成 Docker 镜像的过程
* /jpetstore-db: 在这个目录下面打包程序需要的 mysql 数据库
* green-blue： 如果需要演示 2 个版本，里面有 2 个文件，分别是吧首页的图标的蓝色和绿色的两个图标

### 打包 Mysql 镜像

```
cd jpetstore-db
docker build -t jpetstore-db .
```

### 打包 App 镜像

在工程目录下:
```
docker build -t jpetstore-app .
```

已经打包好了 2 个镜像并且上传到 Hub, 分别是：
*  registry.alauda.cn/alaudasa/docker-jpetstore-app:green
*   registry.alauda.cn/alaudasa/docker-jpetstore-app:blue

### 运行数据库

```
docker run -d --name mysql -p 3306:3306 jpetstore-db
```

已经打包好了，放在了： registry.alauda.cn/alaudasa/docker-jpetstore-db


数据库运行起来之后，可以通过用户名/密码：root/root 来访问数据库，初始化的表和数据都存放在 jpetstore 数据库下面

### 运行 App
```
docker run -it  --link db:db --rm  \
    -e DB_HOST=db \
    -e DB_PORT=3306 \
    -e DB_USER=root \
    -e DB_PASSWORD=root  \
    -p 8080:8080
```

有两种方式来设置需要连接的数据库的配置信息：
* 通过上面环境变量的方式设置：DB_HOST ， DB_PORT，DB_USER，DB_PASSWORD 环境变量
* 通过挂载配置文件，配置文件的路径是：/usr/local/tomcat/webapps/JPetStore/WEB-INF/classes/properties/database.properties , 配置文件格式如下:

```
driver=com.mysql.jdbc.Driver
url=jdbc:mysql://172.17.0.1:3306/jpetstore
username=dbuser
password=password
```

### 访问 App

访问路径是：http://127.0.0.1:8080/JPetStore

### 替换版本
修改文件 "JPetStore/catalog/Main.jsp" 里面，替换里面的 "splash-blue.gif" 成 "splash-green.gif" 就可以把首页中间鹦鹉的颜色从蓝色变成绿色，反之亦然

