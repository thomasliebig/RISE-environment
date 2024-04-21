# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/focal64"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "8192"
  end

  config.vm.provision "shell", inline: <<-SHELL
    # Set environment variables
    sudo echo "LANG=en_US.UTF-8" >> /etc/environment
    sudo echo "LANGUAGE=en_US.UTF-8" >> /etc/environment
    sudo echo "LC_ALL=en_US.UTF-8" >> /etc/environment
    sudo echo "LC_CTYPE=en_US.UTF-8" >> /etc/environment

    # Update and upgrade the system
    sudo apt-get update
    sudo apt-get -y upgrade

    sudo apt-get install -y screen

    # Install Python and pip
    sudo add-apt-repository ppa:deadsnakes/ppa -y
    sudo apt update
    sudo apt-get install -y python3.10 python3.10-venv python3.10-dev python3-pip

    # Install Jupyter Notebook
    sudo pip3 install notebook==6.1.5 #.7

    # jupyter notebook --generate-config

    # Install RISE for Jupyter Notebook presentations
    pip3 install jupyter_contrib_nbextensions==0.5.1
    sudo jupyter contrib nbextension install --user
    sudo runuser -u vagrant jupyter contrib nbextension install
    sudo jupyter-nbextension enable splitcell/splitcell
    sudo jupyter-nbextension enable python-markdown/main
    sudo jupyter-nbextension enable toc2/main
    sudo jupyter-nbextension enable hide_input/main
    sudo jupyter-nbextension enable contrib_nbextensions_help_item/main
    sudo jupyter-nbextension enable nbextensions_configurator/config_menu/main

    # sudo runuser -u vagrant jupyter-nbextension enable splitcell/splitcell
    # sudo runuser -u vagrant jupyter-nbextension enable python-markdown/main
    
    sudo pip3 install RISE
    sudo runuser -u vagrant jupyter-nbextension install rise --py --sys-prefix
    sudo runuser -u vagrant jupyter-nbextension enable rise --py --sys-prefix

    # Install dependencies for Manim Community Edition
    sudo apt-get install -y libcairo2-dev libjpeg-dev libgif-dev libpango1.0-dev ffmpeg sox

    # Install Manim Community Edition
    sudo pip3 install manim

    # Install LaTeX for Manim
    sudo apt-get install -y texlive texlive-latex-extra texlive-fonts-extra texlive-science texlive-fonts-recommended dvipng

    # Run Jupyter Notebook on all IP addresses available on this machine

    pip install jupyterlab-rise

    sudo apt install nodejs -y
    sudo apt install npm -y

    mkdir ~/.jupyter
    chmod a+rwx ~/.jupyter/
    cp /vagrant/jupyter_notebook_config.py ~/.jupyter/jupyter_notebook_config.py
    chmod a+rwx ~/.jupyter/jupyter_notebook_config.py
    mkdir ~/.jupyter/nbconfig
    chmod a+rwx ~/.jupyter/nbconfig
    cp /vagrant/jupyter/.jupyter/nbconfig/* ~/.jupyter/nbconfig/*
    chmod a+rwx ~/.jupyter/nbconfig/*
    # exec notebook
    cd /vagrant/notebooks
    # sudo runuser -u vagrant jupyter notebook

    pip install jupyter_contrib_nbextensions 
    jupyter contrib nbextension install --system 
    jupyter nbextension enable codefolding/main

    jupyter notebook --allow-root > /dev/null 2>&1 &
    
  SHELL

  # Forward Jupyter Notebook port to host
  config.vm.network "forwarded_port", guest: 8888, host: 8000

end

