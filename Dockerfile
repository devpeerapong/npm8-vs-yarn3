FROM node:16.14.0

WORKDIR /home/node
USER node

ENV PATH=/home/node/.npm-global/bin:$PATH
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global 
RUN mkdir /home/node/.npm-global && \
  npm install -g npm@8.5.1 yarn@1.22.17 --force && \
  git clone https://github.com/devpeerapong/npm8-vs-yarn3.git npm8-vs-yarn3 && \
  cd npm8-vs-yarn3/app && \
# Populate global cache for npm, yarn and berry
  npm install && rm -rf node_modules package-lock.json && \
  yarn && rm -rf node_modules yarn.lock && \
  yarn set version 3.2.0 && yarn && rm -rf .yarn .yarnrc.yml yarn.lock .pnp.* && \
  git checkout HEAD .

WORKDIR /home/node/npm8-vs-yarn3
COPY --chown=node:node ./benchmark.sh ./
