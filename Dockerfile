FROM jenkins
USER root

# Add jenkins to the docker group so that it can launch
# more containers from within itself
RUN groupadd -g 111 docker && usermod -a -G docker jenkins

# Install stuff for ruby
RUN apt-get update
RUN apt install -y xz-utils dpkg-dev dput debhelper pkg-kde-tools \
                   devscripts ubuntu-dev-tools git locales \
                   dh-systemd zlib1g-dev python-paramiko \
                   curl gawk libreadline6-dev libssl-dev libyaml-dev \
                   libsqlite3-dev sqlite3 autoconf libgdbm-dev \
                   libncurses5-dev automake libtool bison pkg-config libffi-dev
USER jenkins
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
RUN /bin/bash -lc "curl -sSL https://get.rvm.io | bash -s stable --ruby --auto-dotfiles"
RUN /bin/bash -lc "gem install bundler"
RUN git clone https://github.com/blue-systems/pangea-tooling /tmp/pangea-tooling
RUN /bin/bash -lc "cd /tmp/pangea-tooling && bundler install && bundler update"
RUN rm -rf /tmp/pangea-tooling/

## Please setup ssh keys and ~/.ssh/config manually at this point
