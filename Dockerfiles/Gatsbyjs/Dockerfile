FROM node:12-buster
LABEL maintainer="xuanvillagran@gmail.com"

EXPOSE 8000

ARG environment=develop

RUN yarn global add gatsby-cli

RUN mkdir -p /frontend
WORKDIR /frontend
VOLUME /frontend

COPY ./entry.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entry.sh
ENTRYPOINT ["entry.sh"]
