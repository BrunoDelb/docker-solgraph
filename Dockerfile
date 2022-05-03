# if we use alpine, all text characters in the outputted PNG will be vertical rectangles (unrecognized)
FROM node

# install graphviz
RUN apt-get update -y && apt-get install -y git graphviz

# download + install solgraph
RUN npm install -g solgraph

RUN mkdir /app
COPY png-to-dataurl.js /app/png-to-dataurl.js
COPY run.sh /app/run.sh

WORKDIR /data

# execute start script
CMD ["sh", "/app/run.sh"]
