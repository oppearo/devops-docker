FROM node:16.20.0 as builder
WORKDIR /usr/src/app
COPY ./material-applications/example-frontend .
ENV REACT_APP_BACKEND_URL='http://localhost:8080'

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash
RUN apt install -y nodejs

RUN node -v && npm -v
RUN npm install
RUN npm run build
RUN npm install -g serve

FROM busybox:1.36.1
WORKDIR /usr/src/app
EXPOSE 5000
ENV REACT_APP_BACKEND_URL='http://localhost:8080'

COPY --from=builder /usr/src/app/build /usr/src/app

RUN adduser -D newuser
USER newuser

CMD ["busybox", "httpd", "-f", "-v", "-p", "5000"]
