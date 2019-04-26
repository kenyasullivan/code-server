FROM node:10.15.1

# Install puppeteer deps.
RUN apt-get update && apt-get install -qy gconf-service \
	libnss3 \
	libasound2 \
	libatk1.0-0 \
	libatk-bridge2.0-0 \
	libcairo2 \
	libcups2 \
	libdbus-1-3 \
	libexpat1 \
	libfontconfig1 \
	libgconf-2-4 \
	libgdk-pixbuf2.0-0 \
	libglib2.0-0 \
	libgtk-3-0 \
	libnspr4 \
	libpango-1.0-0 \
	libpangocairo-1.0-0 \
	libx11-6 \
	libx11-xcb1 \
	libxcb1 \
	libxcomposite1 \
	libxcursor1 \
	libxdamage1 \
	libxext6 \
	libxfixes3 \
	libxi6 \
	libxrandr2 \
	libxrender1 \
	libxss1 \
	libxtst6 \
	ca-certificates \
	fonts-liberation \
	libappindicator1 \
	lsb-release \
	xdg-utils \
	wget

# Get libc6 v2.28.x
RUN echo "deb http://ftp.de.debian.org/debian buster main" >> /etc/apt/sources.list && \
	apt-get update && \
	apt-get install -y libc6

# Ensure that yarn is installed.
RUN npm i -g yarn@1.12.3 npx

# Copy CI environment variables, if they exist.
ARG env_vars
RUN if [ "$env_vars" != "" ]; then export $env_vars; env; fi