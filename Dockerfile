FROM ubuntu:16.04
RUN apt-get update \
&& apt-get install curl -y \
&& apt-get install unzip -y \
&& curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
&& unzip awscliv2.zip \
&& aws/install \
&& aws --version \
&& aws s3 ls
