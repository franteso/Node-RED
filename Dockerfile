FROM nodered/node-red:latest

# Switch to root to install packages
USER root

# Install system dependencies
# Added: chromium (for Puppeteer/Playwright), udev/ttf-freefont (for browser rendering)
RUN apk add --no-cache \
    python3 \
    py3-pip \
    make \
    g++ \
    gcc \
    libc-dev \
    linux-headers \
    git \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont

# Switch back to node-red user
USER node-red

# Set working directory
WORKDIR /usr/src/node-red

# ENV for Puppeteer to find Chromium
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# Install Node-RED contrib nodes
RUN npm install --unsafe-perm --no-update-notifier --no-fund --only=production \
    # --- Dashboard & UI ---
    @flowfuse/node-red-dashboard \
    node-red-contrib-uibuilder \
    # --- Database nodes ---
    node-red-node-mysql \
    node-red-contrib-postgresql \
    node-red-node-sqlite \
    node-red-contrib-mongodb4 \
    node-red-contrib-influxdb \
    node-red-contrib-mssql-plus \
    node-red-contrib-stackhero-influxdb-v2 \
    node-red-contrib-stackhero-mysql \
    # --- Messaging & Communication ---
    node-red-contrib-telegrambot \
    node-red-node-email \
    node-red-node-twilio \
    node-red-contrib-discord-advanced \
    node-red-contrib-slack \
    # --- Date/Time utilities ---
    node-red-contrib-moment \
    node-red-contrib-cron-plus \
    # --- Data manipulation ---
    # --- HTTP & Web ---
    node-red-contrib-web-worldmap \
    # --- File operations & Cloud ---
    node-red-contrib-fs-ops \
    node-red-node-aws \
    node-red-contrib-azure-iot-hub \
    # --- IoT & Smart Home ---
    node-red-contrib-home-assistant-websocket \
    node-red-contrib-homebridge-automation \
    node-red-contrib-zigbee2mqtt \
    node-red-contrib-tasmota \
    node-red-contrib-shelly \
    node-red-contrib-tuya-smart-device \
    node-red-contrib-sonos-plus \
    # --- AI & Machine Learning ---
    node-red-contrib-openai \
    node-red-contrib-tensorflow \
    # --- Automation & Workflow ---
    node-red-contrib-loop-processing \
    node-red-contrib-queue-gate \
    node-red-contrib-state-machine \
    node-red-contrib-flow-manager \
    # --- Data visualization ---
    node-red-node-smooth \
    # --- API integrations ---
    node-red-node-google \
    node-red-contrib-airtable \
    # --- Web scraping ---
    node-red-contrib-playwright \
    # --- Advanced networking ---
    node-red-node-ping \
    node-red-node-snmp \
    # --- Security & Auth ---
    node-red-contrib-oauth2 \
    node-red-contrib-jwt \
    node-red-contrib-bcrypt \
    # --- Monitoring ---
    node-red-contrib-logger \
    node-red-contrib-prometheus-exporter \
    # --- Context & Storage ---
    node-red-contrib-context-nodes \
    node-red-contrib-redis \
    # --- Utilities ---
    node-red-contrib-bigtimer \
    node-red-contrib-boolean-logic \
    node-red-contrib-counter \
    node-red-contrib-deduplicate \
    # --- Testing & Dev ---
    # --- Additional Popular ---
    node-red-contrib-image-tools \
    node-red-contrib-advanced-ping \
    node-red-contrib-buffer-parser \
    node-red-contrib-calc \
    node-red-contrib-schedex
# --- FINAL FORCE CONFIG ---
USER root

# 1. Forzamos la creación de la carpeta y permisos
RUN mkdir -p /data && chown -R node-red:node-red /data

# 2. Copiamos el settings a las DOS ubicaciones posibles
COPY settings.js /data/settings.js
COPY settings.js /usr/src/node-red/settings.js

# 3. Aseguramos permisos de ejecución y lectura
RUN chown node-red:node-red /data/settings.js /usr/src/node-red/settings.js
RUN chmod 664 /data/settings.js /usr/src/node-red/settings.js

USER node-red
EXPOSE 1880

# 4. Comando de arranque con puntero EXPLÍCITO al archivo
CMD ["npm", "start", "--", "--userDir", "/data", "--settings", "/data/settings.js"]
