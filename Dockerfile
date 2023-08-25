FROM node:16 as buld-stage

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM node:16-alpine

WORKDIR /app

COPY --from=build-stage /app/build /app

EXPOSE 3000

CMD ["npm", "run", "start"]