FROM centos:centos8
COPY bear install.sh .vimrc.final .vimrc coc-settings.json /root/
RUN /root/install.sh
