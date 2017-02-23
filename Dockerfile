FROM tensorflow/tensorflow:latest

RUN sudo add-apt-repository ppa:webupd8team/java
RUN sudo apt-get update
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | \
   sudo debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | \
   sudo debconf-set-selections
RUN sudo apt-get install oracle-java8-installer -y
RUN echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
RUN curl https://bazel.build/bazel-release.pub.gpg | sudo apt-key add -
RUN sudo apt-get update && sudo apt-get install bazel -y
RUN bazel
RUN sudo apt-get install git -y

CMD ["bash"]
