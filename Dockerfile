FROM node:current-alpine
WORKDIR /app

COPY ["package*.json","./"]
RUN npm install

COPY . .
CMD [ "npm", "start" ]

# Steps followed from here: https://www.youtube.com/watch?v=w6jnDjp5czg

#  Encounters:

#  => ERROR [3/5] COPY pakcage.json ./  0.0s 
#  failed to compute cache key: "/pakcage.json" not found: not found
#  Solution: https://stackoverflow.com/questions/65282627/how-to-solve-the-error-in-package-json-when-creating-an-image
#  COPY ["package*.json","./"]

# Module build failed (from ./node_modules/html-loader/dist/cjs.js):
# Solution: https://stackoverflow.com/questions/60801331/module-build-failed-from-node-modules-html-loader-dist-cjs-js
# Change:
#"start": "react-scripts start"
#To:
#"start": "react-scripts --openssl-legacy-provider start"
# delete yarn.lock
# delete node_modules
# npm install & build all again

# All working, let's add Compose.