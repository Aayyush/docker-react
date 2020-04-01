FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build 

# /app/build is the file location for the build files. 

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
