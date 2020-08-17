FROM ubuntu:16.04
RUN apt-get update \
&& apt-get install curl -y \
&& apt-get install unzip -y \
&& curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
&& unzip awscliv2.zip \
&& aws/install \
&& aws --version \
&& cd /root \
&& mkdir .aws \
&& cd .aws/ \
&& touch config
RUN echo '[profile prod] \n\
output=table \n\
region=us-west-2 \n\
role_arn=arn:aws:iam::596872254694:role/newrole \n\
source_profile=default' > /root/.aws/config
#credential_source=Ec2InstanceMetadata' > /root/.aws/config
RUN aws s3 ls --profile prod
