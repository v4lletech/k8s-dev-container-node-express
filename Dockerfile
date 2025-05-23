# Usa la imagen oficial de Node.js LTS
FROM mcr.microsoft.com/devcontainers/javascript-node:0-18

# Instala herramientas globales y Express Generator
USER root
RUN apt-get update && \
    apt-get install -y git curl && \
    npm install -g express-generator && \
    rm -rf /var/lib/apt/lists/*

# Crea usuario no-root
RUN groupadd --gid 1000 node && \
    useradd --uid 1000 --gid node --shell /bin/bash --create-home node

USER node
WORKDIR /workspaces

# Instala dependencias del proyecto
COPY --chown=node:node . /workspaces
RUN npm install

# Puerto por defecto de la app Express
EXPOSE 3000

CMD ["npm", "start"]
