FROM python:3.12-alpine

RUN apk add --no-cache git

# Pin cookiecutter version for reproducibility
RUN pip install --no-cache-dir cookiecutter==2.5.0

ENTRYPOINT ["cookiecutter"]