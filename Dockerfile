FROM ubuntu:16.04
RUN apt-get update \
&& apt-get install curl -y \
&& apt-get install unzip -y \
&& curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
&& unzip awscliv2.zip \
&& aws/install \
&& aws --version \

&& mkdir .aws \
&& echo “[profile default] “ > ~/.aws/config \
&& echo “output = table“ >> ~/.aws/config \
&& echo “region = us-west-2“ >> ~/.aws/config \
&& echo “role_arn = arn:aws:iam::596872254694:role/service-role/codebuild-test-build-two-service-role“ >> ~/.aws/config \
&& echo “credential_source = Ec2InstanceMetadata“ >> ~/.aws/config \

&& aws s3 ls --profile=default
