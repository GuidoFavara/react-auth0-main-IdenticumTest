FROM node
WORKDIR /app
COPY pakcage.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:1.19.0-aline AS prod-stage
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 3000
CMD ["nginx","-g","deamon off;"]


