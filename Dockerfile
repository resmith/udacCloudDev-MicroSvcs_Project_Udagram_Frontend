# *** 
# *** 1st Stage: Transpile TypeScript 
# *** 
FROM node:15.4.0 AS build
WORKDIR /app
#
RUN npm install -g ionic
#
COPY package*.json /app/
#
RUN npm ci 
#
COPY ./ /app/
# COPY nginx.conf /app/
# COPY ionic.config.json ./
RUN ionic build

# *** 
# *** 2nd Stage: Distribute App 
# *** 
#
# Set app directory
FROM nginx
RUN rm -rf /usr/share/nginx/html/*
COPY --from=build /app/www  /usr/share/nginx/html
# COPY --from=build /app/nginx.conf  /etc/nginx/nginx.conf
#
# # Expose the app port via docker 
# EXPOSE 4200
# #

# # If there is an issue ending early, change cmd from "nginx" to "top"
# # To allow running & getting a shell into the docker container
# CMD ["nginx", "-g", "daemon off;"]
