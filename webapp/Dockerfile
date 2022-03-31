FROM python:3-slim

COPY packages.txt /tmp/

ENV PATH=/root/.local/bin:$PATH

RUN apt-get update && xargs apt-get install -y </tmp/packages.txt
RUN pip install --upgrade pip

WORKDIR free-server
RUN wget -q https://github.com/e-lab-FREE/FREE_Web/releases/latest/download/FREE_Web.zip -O FREE_Web.zip
RUN unzip FREE_Web.zip && rm FREE_Web.zip
RUN pip install --no-cache-dir --user -r REQUIREMENTS.txt

ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

ENV FREE_PRODUCTION on
ENV FREE_SECRET !rhf1+@cs%euw2l6l)+2ots47t++dr48!+)!i^0dtg4y28ub&4
ENV FREE_ALLOWED_HOSTS pendulos-unb.minhaweb.app

ENTRYPOINT ["/tini", "--"]
CMD ["daphne", "-b", "0.0.0.0", "-p", "8000", "freeweb.asgi:application"]
