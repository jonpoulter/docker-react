#Multi-step Process

#Build Phase

FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#/app/build contains the build artefacts

#Run Phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

