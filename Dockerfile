FROM ubuntu:focal

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y python3 python3-pip libpq5

COPY kv_store/requirements.in /tmp/requirements.in
RUN pip3 install -r /tmp/requirements.in && rm /tmp/requirements.in

COPY kv_store /opt/kv_store

ENV FLASK_APP=/opt/kv_store

ENTRYPOINT ["flask", "run", "--host=0.0.0.0"]
