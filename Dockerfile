FROM node:alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY  --from=builder /app/build /usr/share/nginx/html
# no need to run nginx because it is default for this container