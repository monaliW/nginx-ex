FROM registry.access.redhat.com/rhel7/rhel
# Add Web server, update image, and clear cache
COPY ./nginx.repo /etc/yum.repos.d/nginx.repo
# Install nginx
RUN yum -y install nginx && yum -y update; yum clean all
COPY ./index.html /usr/share/nginx/html/index.html
COPY ./default.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
