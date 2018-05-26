FROM centos:7

RUN yum install -y nginx
ADD index.html /usr/share/nginx/html/

EXPOSE 80
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;", "-c", "/etc/nginx/nginx.conf"]
