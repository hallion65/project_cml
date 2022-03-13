FROM ubuntu:latest
# will force apt-get to work automatic and unattended mode
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y

# install basic packages
RUN apt-get install nano
RUN apt-get install cron
RUN apt-get install -y tzdata
RUN apt-get install -y curl
RUN apt-get install -y git
RUN apt-get install -y openjdk-11-jdk-headless

# install nodejs
RUN curl -sSL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

WORKDIR /home/sali/jupyterlab

# install python and dependencies
RUN apt-get install -y python3 python3-pip libatlas-base-dev wget gfortran libhdf5-dev libc-ares-dev libeigen3-dev libopenblas-dev libblas-dev liblapack-dev 
RUN apt-get install python3-virtualenv -y
RUN apt-get install -y libmariadb3 libmariadb-dev
RUN apt-get install zip unzip

# install jupyterlab
RUN pip3 install --upgrade pip
RUN pip3 install --upgrade setuptools
RUN pip3 install jupyterlab

# install custom packages
RUN pip3 install -U pyvisa-py
RUN pip3 install numpy
RUN pip3 install pyspark
RUN pip3 install sympy
RUN pip3 install psycopg2-binary
RUN pip3 install pyTelegramBotAPI
RUN pip3 install plotly
RUN pip3 install ipywidgets>=7.6
RUN pip3 install jupyter-dash jupyterlab-dash
RUN pip3 install mariadb
RUN pip3 install ipython-sql
RUN pip3 install PyMySQL
RUN pip3 install jupyterlab-git
RUN pip3 install install-jdk
RUN pip3 install bash_kernel
RUN cp ./mysql-connector-java-8.0.28.jar /usr/local/lib/python3.8/dist-packages/pyspark/jars/mysql-connector-java-8.0.28.jar
RUN git clone https://github.com/frankfliu/IJava.git
RUN cd IJava/ && ./gradlew installKernel && cd .. && rm -rf IJava/
RUN rm -rf ~/.gradle

# install ijavascript
RUN npm -g config set user root
RUN npm install -g --unsafe-perm ijavascript
RUN ijsinstall --install=global

# rebuild jupyterlab
RUN jupyter lab build

# dependencies for RaspberryPi/ ARM64
ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-arm64 /usr/bin/tini
RUN chmod +x /usr/bin/tini
ENTRYPOINT ["/usr/bin/tini", "--"]

CMD ["/bin/sh", "-c", "jupyter lab --port=${PORT} --no-browser --ip=0.0.0.0 --allow-root --NotebookApp.token=${TOKEN} --NotebookApp.password=${PASSWORD}"]
