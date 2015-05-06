FROM jenkins
USER root
RUN apt-get update
RUN apt install -y xz-utils dpkg-dev ruby dput debhelper pkg-kde-tools \
                   devscripts ubuntu-dev-tools git \
                   dh-systemd ruby-dev zlib1g-dev python-paramiko \
                   curl
USER jenkins
RUN curl -sSL https://get.rvm.io | bash -s stable --ruby
RUN gem install bundler
RUN git clone https://github.com/blue-systems/pangea-tooling /tmp/
RUN cd /tmp/ && bundler install && bundler update
