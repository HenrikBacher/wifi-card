FROM node:lts-alpine as builder

WORKDIR /tmp
COPY . .

RUN npx prettier --check ./src
RUN yarn && yarn build 

###
# production image
FROM nginx:stable-alpine
COPY --from=builder /tmp/build /usr/share/nginx/html
