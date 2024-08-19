FROM python:3.12.4-alpine

COPY requirements.txt /temp/requirements.txt

COPY api /api
WORKDIR /api
EXPOSE 8000

RUN apk add postgresql-client build-base postgresql-dev

RUN pip install -r /temp/requirements.txt

RUN adduser --disabled-password api-user

USER api-user

