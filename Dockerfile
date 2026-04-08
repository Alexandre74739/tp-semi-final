FROM node:24-alpine

WORKDIR /app

COPY package.json ./

RUN npm install

# il faut un dockerignore pour ne pas copier les node_modules, sinon ça va faire planter le build 
COPY . .

RUN npm run build

EXPOSE 4173

# preview et pas dev, c'est pour l'optimisation
CMD ["npm", "run", "preview"]