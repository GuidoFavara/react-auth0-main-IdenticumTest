#  Auth0 React - Identicum 馃攼

<img align="center" alt="GIF" src="https://github.com/GuidoFavara/react-auth0-main-IdenticumTest/blob/master/2022-05-09-15-07-37.gif?raw=true" width="500" height="320" />

Introducci贸n

La idea de este ejercicio es replicar algunos tipos de tecnolog铆as con las que trabajamos, y un t铆pico proceso de laboratorio para armar con tiempo y Googleando.
El armado de laboratorio no requiere necesariamente conocimiento previo en todas las tecnolog铆as involucradas.

Contexto

En aplicaciones web modernas, es cada vez m谩s com煤n realizar autenticaci贸n y autorizaci贸n a trav茅s de protocolos standard de federaci贸n. Hist贸ricamente, esto se realizaba con SAML, pero en los 煤ltimos a帽os se reemplaz贸 por el uso de OAuth y OpenID Connect.

Objetivo

Preparar/configurar una aplicaci贸n (m铆nima) para hacer login social (puede ser con Google/Facebook/Microsoft/Twitter/etc).
Puede ser un "Hello World" propio, en cualquier lenguaje, o alguna aplicaci贸n de demo pre-existente (buscar en internet) que se pueda configurar para hacer autenticaci贸n federada.
 
Requisitos t茅cnicos

Guardar c贸digo (si aplicara), configuraci贸n y cualquier tipo de documentaci贸n realizada en un repositorio GitHub.
Armar configuraci贸n para poder ejecutar en contenedor/es Docker, idealmente en un docker-compose.
Mecanica
La idea es agendar una llamada para que puedas contarnos qu茅 pudiste hacer, problemas con los que te encontraste, etc.
Durante ese per铆odo, nos poder pasar dudas o consultas.

I have choosed Auth0 as authentication method.

#  Encounters:
Error:  
  => ERROR [3/5] COPY pakcage.json ./  0.0s   
  failed to compute cache key: "/pakcage.json" not found: not found  
  Solution: https://stackoverflow.com/questions/65282627/how-to-solve-the-error-in-package-json-when-creating-an-image  
  COPY ["package*.json","./"]  
Error:  
 Module build failed (from ./node_modules/html-loader/dist/cjs.js):  
 Solution: https://stackoverflow.com/questions/60801331/module-build-failed-from-node-modules-html-loader-dist-cjs-js  
 
# Solved with:  
"start": "react-scripts start"  
To:  
"start": "react-scripts --openssl-legacy-provider start"  
 delete yarn.lock  
 delete node_modules  
 npm install & build all again  

# All working, let's add Compose.  

# Encounters:  

The files aren't real-time sync  
 Tried cmd instead of powershell, it didn't work .env file + compose should fix it  
New Error:  

 => ERROR [build 6/6] RUN npm run build                                                                                                                                                         9.8s   
 > [build 6/6] RUN npm run build:  
14 0.450  
14 0.450 > auth0-example@0.1.0 build/  
14 0.450 > react-scripts build  
14 0.450  
14 1.230 Creating an optimized production build...  
14 9.783 Failed to compile.  
14 9.783  
14 9.783 Error: error:0308010C:digital envelope routines::unsupported  
14 9.783     at String.replace (<anonymous>)  
14 9.783  
14 9.783  

 Tried changing the Node Version and it didn't work  
 Followed: https://stackoverflow.com/questions/47008159/how-to-downgrade-node-version  

# Solution:  
https://stackoverflow.com/questions/69692842/error-message-error0308010cdigital-envelope-routinesunsupported  

FROM node:alpine  
You can switch to something like:  
FROM node:16-alpine3.12  

I have only included node:16 and it worked.  

 #This can be executed with:  
 
 docker-compose -f docker-compose.yml -f  docker-compose-prod.yml up -d --build  
 That command will run on port 3000  
 or  
 docker-compose -f docker-compose.yml -f  docker-compose-dev.yml up -d --build  
 This command will run on port 8080  
