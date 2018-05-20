FROM centos:7

RUN yum update -y \
 && yum install -y \
      epel-release autoconf bash-completion bc bind-utils chrony cifs-utils \
      cmake dstat expect git gcc gcc-c++ ldns ldns-devel libcurl-devel \
      libevent-devel libtool libverto-devel lsof m4 make mailx mlocate mtr \
      nc net-tools nfs-utils nmap ncurses-devel openssl-devel patch \
      pam-devel perl-ExtUtils-MakeMaker psmisc rcs rsync rsyslog ruby \
      samba-client screen sendmail-devel subversion sudo syslinux sysstat \
      telnet tmux traceroute vim wget whois zsh \
 && yum --enablerepo=epel install -y \
      colordiff fio iftop jq lbzip2 nethogs nginx nkf

RUN yum clean all
