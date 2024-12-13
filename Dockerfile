FROM  jupyter/pyspark-notebook:latest
ENV JUPYTER_PORT=8888

WORKDIR /app
USER root
# Install dependencies
COPY requirements.txt .
RUN set -ex; \
    apt-get update; \
    apt-get install -y python3 python3-pip; \
    rm -rf /var/lib/apt/lists/*; \
    python3 --version; \
    pip3 --version; \
    pip3 install --no-cache-dir -r requirements.txt; \
    pip3 install --no-cache-dir jupyter

COPY . .

EXPOSE ${JUPYTER_PORT}
CMD ["jupyter", "notebook", "--no-browser", "--NotebookApp.token=''", "--NotebookApp.password=''", "--ip=0.0.0.0", "--port=${JUPYTER_PORT}", "--allow-root", "start-notebook.sh"]