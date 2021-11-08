FROM alpine
COPY src/test/ /root/demo
WORKDIR /root/demo
RUN apk add openjdk8
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV PATH $PATH:$JAVA_HOME/bin
RUN javac test.java
CMD java -classpath src/test test.test
