FROM tomcat:8

ENV TZ="Asia/Shanghai" \
    JAVA_OPTS="-Xms256m -Xmx512m -XX:MaxMetaspaceSize=256m"

#设置环境变量
ENV DIR_WEBAPP /usr/local/tomcat/webapps

#删除webapps下所有文件
RUN rm -rf $DIR_WEBAPP/*

#替换server.xml
ADD conf/server.xml /usr/local/tomcat/conf/
ADD -rf webapps/treenms/* $DIR_WEBAPP/ROOT/