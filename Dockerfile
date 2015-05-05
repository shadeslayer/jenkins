FROM jenkins
USER root
RUN apt-get update && apt-get -y install rake ruby
USER jenkins
