FROM ubuntu:20.04

# Prevent interactive prompts (like tzdata timezone setup)
ENV DEBIAN_FRONTEND=noninteractive

# Install Apache and clean up afterward
RUN apt update -y && \
    apt install -y apache2 tzdata && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Copy your HTML page into Apache's web directory
COPY index.html /var/www/html/

# Expose default HTTP port
EXPOSE 80

# Start Apache in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]
