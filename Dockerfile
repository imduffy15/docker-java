FROM maven:3-jdk-10

RUN apt-get update
RUN apt-get install apt-transport-https software-properties-common curl ca-certificates -y

RUN export CLOUD_SDK_REPO="cloud-sdk-$(sed -n 's/VERSION=\"\S* (\(\w*\))\"/\1/p' /etc/os-release)" && \
    echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get update -y && apt-get install google-cloud-sdk -y
