FROM alpine
WORKDIR /root/demo
COPY src/test/test.java /root/demo
RUN apk add openjdk8
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV PATH $PATH:$JAVA_HOME/bin
RUN javac test.java
ENTRYPOINT java test
