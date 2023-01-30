FROM centos:centos8
COPY install.sh .vimrc.final .vimrc coc-settings.json /root/
RUN /root/install.sh
