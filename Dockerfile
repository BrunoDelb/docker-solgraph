FROM node

# install graphviz
RUN apt-get update -y && apt-get install -y git graphviz

# download + install solgraph
RUN npm install -g solgraph

RUN mkdir /app
COPY --chmod=755 run.sh /app/run.sh

WORKDIR /data

CMD ["sh", "/app/run.sh"]
