FROM python:2.7
WORKDIR /test

ADD requirements.txt /tmp
RUN pip install -r /tmp/requirements.txt

RUN mkdir -p /usr/src/hello-world-printer/
ADD hello_world/ /usr/src/hello-world-printer/hello_world

ADD main.py /usr/src/hello-world-printer
RUN ls /usr/src/hello-world-printer

CMD PYTHONPATH=$PYTHONPATH:/usr/src/hello-world-printer \
      FLASK_APP=hello_world flask run --host=0.0.0.0
