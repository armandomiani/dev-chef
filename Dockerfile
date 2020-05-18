FROM ruby

RUN apt update && apt -y install curl procps

RUN curl -o chef.deb https://packages.chef.io/files/stable/chef/16.1.0/debian/10/chef_16.1.0-1_amd64.deb \
    && dpkg -i chef.deb \
    && rm -f chef.deb

RUN gem install chef-zero

ADD cookbooks /cookbooks
ADD docker-entrypoint.sh /docker-entrypoint.sh

VOLUME ["/cookbooks"]

ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD ["tail", "-f", "/dev/null"]
