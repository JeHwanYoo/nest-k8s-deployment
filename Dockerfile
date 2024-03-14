FROM node:latest as base

# use pnpm
RUN corepack enable

# set app directiory
WORKDIR /usr/src/app

# copy dependencies
COPY package.json ./
COPY pnpm-lock.yaml ./
COPY tsconfig*.json ./
COPY nest-cli.json ./

FROM base as installation

# copy the source code
COPY src ./src

# install dependencies
RUN pnpm install --frozen-lockfile

FROM installation as build

# get dependencies
COPY --from=installation /usr/src/app/node_modules ./node_modules

# build the source code
RUN pnpm build

FROM build as deployment

# copy the build result
COPY --from=build /usr/src/app/dist ./dist

# expose the port
EXPOSE 3000

# run app
CMD pnpm start:prod
