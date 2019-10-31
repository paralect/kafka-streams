FROM java

WORKDIR /stream

RUN apt-get update ; \
    apt-get install maven -yqq

COPY streams.examples .

RUN mvn clean package -DskipTests

ENTRYPOINT [ "mvn", "exec:java", "-Dexec.mainClass=myapps.Pipe" ]
