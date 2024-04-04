FROM ubuntu:focal

# Set the working directory in the container
# RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1001 ubuntu
WORKDIR /root/

RUN echo "LANG=en_US.UTF-8" >> /etc/environment
RUN echo "LANGUAGE=en_US.UTF-8" >> /etc/environment
RUN echo "LC_ALL=en_US.UTF-8" >> /etc/environment
RUN echo "LC_CTYPE=en_US.UTF-8" >> /etc/environment

RUN apt update
RUN apt install software-properties-common -y
RUN apt -y upgrade

RUN add-apt-repository ppa:deadsnakes/ppa -y
RUN apt update
RUN apt install -y python3.10 python3.10-venv python3.10-dev python3-pip

RUN pip3 install notebook==6.1.5

RUN pip3 install jupyter_contrib_nbextensions==0.5.1
RUN jupyter contrib nbextension install
RUN jupyter contrib nbextension install
RUN jupyter-nbextension enable splitcell/splitcell
RUN jupyter-nbextension enable python-markdown/main
RUN jupyter-nbextension enable toc2/main
RUN jupyter-nbextension enable hide_input/main
RUN jupyter-nbextension enable contrib_nbextensions_help_item/main
RUN jupyter-nbextension enable nbextensions_configurator/config_menu/main

RUN pip3 install RISE
RUN jupyter-nbextension install rise --py --sys-prefix
RUN jupyter-nbextension enable rise --py --sys-prefix

RUN apt install -y libcairo2-dev libjpeg-dev libgif-dev libpango1.0-dev ffmpeg sox

RUN pip3 install manim

RUN apt install -y texlive texlive-latex-extra texlive-fonts-extra texlive-science texlive-fonts-recommended dvipng

RUN pip install jupyterlab-rise

RUN apt install nodejs -y
RUN apt install npm -y

#RUN mkdir ~/.jupyter
RUN chmod a+rwx ~/.jupyter/
COPY jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py
RUN chmod a+rwx ~/.jupyter/jupyter_notebook_config.py
#RUN mkdir ~/.jupyter/nbconfig
#RUN chmod a+rwx ~/.jupyter/nbconfig
#RUN cp ./jupyter/.jupyter/nbconfig/* ~/.jupyter/nbconfig/*
#RUN chmod a+rwx ~/.jupyter/nbconfig/*

EXPOSE 8888
VOLUME [ "/root/notebooks" ]
WORKDIR /root/notebooks

ENTRYPOINT ["jupyter", "notebook", "--allow-root" ]