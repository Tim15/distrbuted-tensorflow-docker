FROM tensorflow/tensorflow:latest

RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | \
   debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | \
   debconf-set-selections
RUN apt-get install oracle-java8-installer -y
RUN echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list
RUN curl https://bazel.build/bazel-release.pub.gpg | apt-key add -
RUN apt-get update && apt-get install libcurl3-dev bazel -y
RUN git clone https://github.com/tensorflow/tensorflow.git /tensorflow

CMD ["bash"]
