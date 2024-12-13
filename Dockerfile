FROM python:3.12

WORKDIR /app

COPY app.py app.py

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

ENTRYPOINT [ "bash" ]