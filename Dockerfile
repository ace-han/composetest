FROM python:3.9-alpine
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
COPY . /code/
# since pip does not install dev-dependencies in pyproject.toml (by the time of writing)
# 1. maintain another requirements.txt (like saleor)
# 2. install poetry in docker env to get dev-depencendies work
# refer to 
# https://github.com/python-poetry/poetry/issues/3514

# using pip
RUN pip install -r requirements.txt

# using poetry 
# (this way is hard, modifying `/etc/hosts`, installing curl/poetry are very tricky in docker image)
# (refer to https://github.com/snok/install-poetry/blob/main/action.yml)
# RUN apk --no-cache add curl

# refer to https://github.com/hawtim/blog/issues/10 for `githubusercontent.com` issue
# RUN echo '199.232.96.133 raw.githubusercontent.com' >> /etc/hosts \
# && curl -O -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py \
# && python get-poetry.py --yes \
# && rm get-poetry.py \
# && source $HOME/.poetry/env \
# && poetry config virtualenvs.create false \
# && poetry install --no-root