# Janus WebRTC Server
FROM canyan/janus-gateway:master AS janus

COPY packages.txt /tmp/
COPY requirements.txt /tmp/

ENV PATH=/root/.local/bin:$PATH

RUN apt-get update && xargs apt-get install -y </tmp/packages.txt
RUN pip install --upgrade pip \
 && pip install --no-cache-dir --user -r /tmp/requirements.txt
#RUN if [ ! -d "/Video_Tester" ] ; then git clone https://github.com/e-lab-FREE/Video_Tester /Video_Tester ; fi

# Django webapp
FROM janus AS webapp
ARG INSTDIR=/free-server
RUN git clone https://github.com/bgeneto/wpa-freeweb.git $INSTDIR
WORKDIR $INSTDIR
RUN pip install --no-cache-dir --user -r REQUIREMENTS.txt
COPY ./config/.env $INSTDIR/freeweb/.env
RUN python3 manage.py collectstatic

ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

#ENV FREE_PRODUCTION on
#ENV FREE_SECRET !rhf1+@cs%euw2l6l)+2ots47t++dr48!+)!i^0dtg4y28ub&4
#ENV FREE_ALLOWED_HOSTS 164.41.98.189,164.41.98.190,wpaunb.webonly.app

ENTRYPOINT ["/tini", "--"]
CMD ["daphne", "-b", "0.0.0.0", "-p", "8000", "freeweb.asgi:application"]

