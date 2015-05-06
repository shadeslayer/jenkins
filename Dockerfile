FROM jenkins
USER root
RUN apt-get update
RUN apt install -y xz-utils dpkg-dev ruby dput debhelper pkg-kde-tools \
                   devscripts ubuntu-dev-tools git \
                   dh-systemd ruby-dev zlib1g-dev python-paramiko \
                   curl
USER jenkins
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN curl -sSL https://get.rvm.io | bash -s stable --ruby
RUN gem install bundler
RUN git clone https://github.com/blue-systems/pangea-tooling /tmp/
RUN cd /tmp/ && bundler install && bundler update
RUN rm -rf /tmp/pangea-tooling/
