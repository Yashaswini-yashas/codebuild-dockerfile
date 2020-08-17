FROM ubuntu:16.04
RUN apt-get update \
&& apt-get install curl -y \
&& apt-get install unzip -y \
&& curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
&& unzip awscliv2.zip \
&& aws/install \
&& aws --version \

RUN aws sts assume-role --role-arn "arn:aws:iam::596872254694:role/newrole" --role-session-name "ProdData" > sts.txt
RUN cat sts.txt

RUN aws s3 ls
