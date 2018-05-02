FROM node:8-alpine

RUN apk add --no-cache make gcc g++ python

RUN mkdir ~/app
WORKDIR /home/node/app

COPY package.json package.json
COPY package-lock.json package-lock.json

ARG NPM_TOKEN

RUN echo "//registry.npmjs.org/:_authToken=${NPM_TOKEN}" > ~/.npmrc \
    && npm install --production \
    && rm ~/.npmrc

COPY . .

RUN chown -R node /home/node

USER node

CMD [ "./build.sh", "all", "dev" ]