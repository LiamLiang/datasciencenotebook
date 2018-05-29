# Data science Jupyter notebook for jupyter-repo2docker

Author:  
(c) 2018 Daniel E. Acuña  
http://acuna.io  
Assistant Professor  
School of Information Studies  
Syracuse University

Licence: MIT

## Purpose

Build a docker image usable for 
[Zero to JupyterHub](http://zero-to-jupyterhub-with-kubernetes.readthedocs.io/en/latest/)

This image contains:

- Spark 2.3
- Pyspark
- Pandas
- sklearn
- seaborn


```commandline
jupyter-repo2docker --user-name jovyan \
    --image-name USER/REPO:TAG \
    --no-run https://github.com/daniel-acuna/datasciencenotebook
```