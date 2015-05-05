FROM jenkins
USER root
RUN apt-get update && apt-get -y install rake ruby
RUN groupadd -g 5000 buildd
RUN usermod -a -G buildd jenkins
USER jenkins
