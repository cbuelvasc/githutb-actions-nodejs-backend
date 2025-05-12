FROM node:16

ENV MONGODB_CONNECTION_PROTOCOL mongodb+srv
ENV MONGODB_DB_NAME gha-demo1
ENV MONGODB_CLUSTER_ADDRESS cluster0.uzt6tbz.mongodb.net
ENV MONGODB_USERNAME cbuelvasc
ENV MONGODB_PASSWORD qpY4ldN5SGago7sG

WORKDIR /app
COPY package*.json .
RUN npm install
COPY . .
CMD ["npm", "start"]