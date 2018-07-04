FROM debian:latest

LABEL maintainer="p0n <p0n@necologylife.com>"

ARG VERSION=3.2.0.1227

WORKDIR /root

RUN apt-get update && \
    apt-get -y --no-install-recommends install curl unzip && \
    apt-get clean && \
    curl --insecure -o ./sonar-scanner.zip -L https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${VERSION}-linux.zip && \
    unzip sonar-scanner.zip && \
    rm sonar-scanner.zip

ENV PATH $PATH:/root/sonar-scanner-${VERSION}-linux/bin

CMD ["sonar-scanner", "-Dsonar.projectBaseDir=./"]
