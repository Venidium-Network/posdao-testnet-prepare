FROM node:12-alpine

WORKDIR /testnet

COPY .git ./.git
COPY .gitmodules ./.gitmodules
COPY scripts ./scripts
COPY package*.json ./
COPY posdao-contracts ./posdao-contracts
COPY upgradeable-artifacts ./posdao-contracts/upgradeable-artifacts

RUN apk update && apk upgrade && \
    apk add --no-cache git python3 py3-pip make g++
RUN npm install -g npm@latest

ENTRYPOINT ["npm","run"]
CMD ["start"]
