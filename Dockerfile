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
    jupyter nbextension install --sys-prefix --py nbgrader --overwrite && \
    jupyter nbextension enable --sys-prefix --py nbgrader && \
    jupyter serverextension enable --sys-prefix --py nbgrader && \
    jupyter nbextension disable --sys-prefix create_assignment/main && \
    jupyter serverextension disable --sys-prefix nbgrader.server_extensions.formgrader && \
    jupyter nbextension disable --sys-prefix --section=tree assignment_list/main && \
    jupyter nbextension disable --sys-prefix --section=tree formgrader/main && \
    rm -rf /home/$NB_USER/.local && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

RUN rm /tmp/requirements.txt

USER $NB_UID