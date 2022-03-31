FROM canyan/janus-gateway:latest

COPY packages.txt /tmp/
COPY requirements.txt /tmp/

RUN apt-get update && xargs apt-get install -y </tmp/packages.txt
RUN pip install --upgrade pip \
 && pip install --no-cache-dir --user -r /tmp/requirements.txt