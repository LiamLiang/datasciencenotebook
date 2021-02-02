FROM jupyter/pyspark-notebook:5cb007f03275

LABEL maintainer="Daniel Acuna <deacuna@syr.edu>"

USER root

RUN apt-get update && apt-get install -y \
  libxml2-dev \
  libxslt-dev

RUN pip install \
    "nbgrader==0.5.4" \
    "git+https://github.com/data-8/nbgitpuller" \
    "jupyter-spark==0.4.0" \
    "lxml==4.2.1" \
    "RISE==5.3.0" \
    "bqplot==0.11.1" \
    "torch" \
    "torchvision" \
    "dask[complete]" \
    && \
    jupyter serverextension enable --py jupyter_spark --sys-prefix && \
    jupyter serverextension enable --py nbgitpuller --sys-prefix && \
    jupyter nbextension install --py jupyter_spark --sys-prefix && \
    jupyter nbextension enable --py jupyter_spark --sys-prefix && \
    jupyter nbextension enable --py widgetsnbextension --sys-prefix && \
    jupyter nbextension install --sys-prefix --py nbgrader --overwrite && \
    jupyter nbextension enable --sys-prefix --py nbgrader && \
    jupyter serverextension enable --sys-prefix --py nbgrader && \
    jupyter nbextension disable --sys-prefix create_assignment/main && \
    jupyter serverextension disable --sys-prefix nbgrader.server_extensions.formgrader && \
    jupyter nbextension disable --sys-prefix --section=tree assignment_list/main && \
    jupyter nbextension disable --sys-prefix --section=tree formgrader/main && \
    jupyter-nbextension install rise --py --sys-prefix && \
    jupyter-nbextension enable rise --py --sys-prefix && \
    rm -rf /home/$NB_USER/.local && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

COPY logo-thumb-ischool-2017-fullcolor.png /opt/conda/lib/python3.6/site-packages/notebook/static/custom/
COPY custom.css /opt/conda/lib/python3.6/site-packages/notebook/static/custom/

USER $NB_UID

