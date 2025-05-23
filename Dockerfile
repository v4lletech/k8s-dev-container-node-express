# Usa la variante ligera de Nginx
FROM nginx:alpine

# Instala bash en Alpine
RUN apk update && apk add --no-cache bash

# Copia todos los ficheros del workspace al directorio de Nginx
COPY . /usr/share/nginx/html

# Expon el puerto 80 (opcional, pero explícito)
EXPOSE 80
