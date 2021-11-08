FROM alpine
COPY src/ /files/
RUN ls -la /files/*
WORKDIR /files/
RUN apk add openjdk8
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV PATH $PATH:$JAVA_HOME/bin
RUN javac test/test.java
CMD java test.test
