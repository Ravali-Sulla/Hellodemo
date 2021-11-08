FROM alpine
COPY . /var/www/java  
WORKDIR /var/www/java
RUN apk add openjdk8
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV PATH $PATH:$JAVA_HOME/bin
RUN javac test.java
ENTRYPOINT java test
