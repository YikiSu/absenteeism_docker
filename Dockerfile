# Author: Yiki Su
FROM rocker/tidyverse

USER root

RUN apt-get update --fix-missing 

# install python3
RUN apt-get install -y \
		python3-pip \
		python3-dev

		

# install R packages
RUN apt-get update -qq && install2.r --error \
    --deps TRUE \
    knitr \
    feather \
    ggcorrplot \
    ggthemes \
    reticulate \
    docopt 
    
# install anaconda & put it in the PATH
RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh 

# put anaconda python in path
ENV PATH="/opt/conda/bin:${PATH}"

# Updating Anaconda packages
RUN conda update -y -n base -c defaults conda


# install python packages
RUN conda install -y -c conda-forge pyarrow

RUN conda install -y -c https://repo.anaconda.com/pkgs/main/linux-64/pyarrow-0.15.1-py38h962f231_0.tar.bz2 pyarrow=0.15.1

RUN conda install -y -c conda-forge feather-format 
   
RUN conda install -y -c anaconda docopt \
    requests \
    pandas \
    seaborn \
    scikit-learn
    
RUN conda update -y --all
    

    

    
   
