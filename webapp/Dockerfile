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

ENTRYPOINT ["/tini", "--"]
CMD ["daphne", "-b", "0.0.0.0", "-p", "8000", "freeweb.asgi:application"]
