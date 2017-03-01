FROM ubuntu:latest

# Adding SSH Key
RUN mkdir -p /root/.ssh
ADD id_rsa /root/.ssh/id_rsa
RUN chmod 700 /root/.ssh/id_rsa
RUN echo "Host github.com\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config

COPY setup.sh /setup.sh
RUN ./setup.sh