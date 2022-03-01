FROM silaskalmbach/jupyterlab:latest

RUN apt update
RUN apt upgrade -y
RUN apt-get install -y openjdk-11-jdk-headless
RUN pip3 install --upgrade pip
RUN pip3 install pyspark
RUN pip3 install pandas
RUN pip3 install ipywidgets
RUN apt-get install -y libmariadb3 libmariadb-dev 
RUN pip3 install mariadb
RUN pip3 install PyMySQL
RUN pip3 install install-jdk
RUN apt-get install -y git

RUN apt-get install -y curl

RUN git clone https://github.com/frankfliu/IJava.git
RUN cd IJava/ && ./gradlew installKernel && cd .. && rm -rf IJava/
RUN rm -rf ~/.gradle
RUN pip3 install bash_kernel