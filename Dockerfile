FROM node:latest

#ENV PARSE_HOME /parse-dashboard
ENV PARSE_HOME /src
ADD . $PARSE_HOME
WORKDIR $PARSE_HOME

RUN npm install && \
    npm run build && \
    npm cache clear && \
    rm -rf ~/.npm && \
    rm -rf /var/lib/apt/lists/*

ENV PORT 4040
EXPOSE $PORT

#ENV PARSE_DASHBOARD_APP_ID
#ENV PARSE_DASHBOARD_MASTER_KEY
#ENV PARSE_DASHBOARD_SERVER_URL
#ENV PARSE_DASHBOARD_ALLOW_INSECURE_HTTP
#ENV PARSE_DASHBOARD_APP_NAME
#ENV PARSE_DASHBOARD_USER_ID
#ENV PARSE_DASHBOARD_USER_PASSWORD
#ENV PARSE_DASHBOARD_CONFIG

CMD ["npm", "run", "dashboard"]
