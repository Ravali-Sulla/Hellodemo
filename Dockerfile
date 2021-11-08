FROM alpine
COPY . /src /root/demo
WORKDIR /root/demo
RUN apk add openjdk8
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV PATH $PATH:$JAVA_HOME/bin
RUN javac /test/test.java
CMD java -classpath test.test
