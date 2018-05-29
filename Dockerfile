FROM jupyter/all-spark-notebook

LABEL maintainer="Daniel Acuna <deacuna@syr.edu>"

USER root

COPY requirements.txt /tmp/

RUN pip install -r /tmp/requirements.txt \
    && \
    jupyter serverextension enable --py jupyter_spark --sys-prefix && \
    jupyter serverextension enable --py nbgitpuller --sys-prefix && \
    jupyter nbextension install --py jupyter_spark --sys-prefix && \
    jupyter nbextension enable --py jupyter_spark --sys-prefix && \
    jupyter nbextension enable --py widgetsnbextension --sys-prefix && \
    rm -rf /home/$NB_USER/.local && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

RUN rm /tmp/requirements.txt

USER $NB_UID