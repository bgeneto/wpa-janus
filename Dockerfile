FROM canyan/janus-gateway:master

COPY packages.txt /tmp/
COPY requirements.txt /tmp/

ENV PATH=/root/.local/bin:$PATH

RUN apt-get update && xargs apt-get install -y </tmp/packages.txt
RUN pip install --upgrade pip \
 && pip install --no-cache-dir --user -r /tmp/requirements.txt
RUN if [ ! -d "/Video_Tester" ] ; then git clone https://github.com/e-lab-FREE/Video_Tester /Video_Tester ; fi
