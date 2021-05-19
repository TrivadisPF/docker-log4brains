FROM node:15.12.0-stretch-slim AS build

RUN npm i -g --unsafe-perm sharp@^0.27.0
#RUN apt update && apt install -y python3 libvips-dev libglib2.0-dev


FROM build

env ADR_HOME=/opt/adr

WORKDIR /usr/src/app

# install it first locally, to make sure that the dependencies to next are correct (10.0.7)
#COPY package-lock.json ./
#COPY package.json ./
#RUN npm install

# install it globally and overwrite the dependencies (hack until it is fixed in the official log4brains repo)
RUN npm install -g log4brains
#RUN cp -r node_modules/ /usr/local/lib/node_modules/log4brains

WORKDIR ${ADR_HOME}

COPY docs ./docs
COPY .log4brains.yml ./

EXPOSE 4004

CMD [ "log4brains", "preview" ]
