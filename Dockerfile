FROM centos:centos8.4.2105
LABEL com.circleci.preserve-entrypoint=true

ENV ANSIBLE_HOST_KEY_CHECKING=False

RUN yum check-update; \
    yum install -y gcc libffi-devel python3 epel-release; \
    yum install -y python3-pip; \
    yum install -y wget; \
    yum install -y git; \
    yum install -y tar; \
    yum install -y gzip; \
    yum install -y ca-certificates; \
    yum clean all

RUN pip3 install --upgrade pip; \
    pip3 install --upgrade virtualenv; \
    pip3 install pywinrm[kerberos]; \
    pip3 install pywinrm; \
    pip3 install jmspath; \
    pip3 install requests; \
    python3 -m pip install ansible;

ENTRYPOINT ["bash"]