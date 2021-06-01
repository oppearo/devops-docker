# this was altered from the previous ones since I previously forgot to copy the package*.json and npm run build failed, duh
FROM node:alpine
EXPOSE 5000
WORKDIR /usr/src/app
COPY package*.json /usr/src/app/
RUN npm install
COPY . .
ENV REACT_APP_BACKEND_URL=http://localhost:8080
RUN npm run build
RUN npm install -g serve
CMD ["serve", "-s", "-l", "5000", "build"]