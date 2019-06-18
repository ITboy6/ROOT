FROM goodrainapps/tomcat:8.5.20-jre8-alpine

ENV TOMCAT_PATH=/usr/local/tomcat
RUN wget -q http://rainbond-pkg.oss-cn-shanghai.aliyuncs.com/xinanminda/ROOT.war -O ${TOMCAT_PATH}/webapps/ROOT.war \
    && rm -rf ${TOMCAT_PATH}/webapps/ROOT \
    && unzip -d ${TOMCAT_PATH}/webapps/ROOT ${TOMCAT_PATH}/webapps/ROOT.war && rm -rf ${TOMCAT_PATH}/webapps/ROOT.war
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["/docker-entrypoint.sh"]
