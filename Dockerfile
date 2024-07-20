# Use the official Jenkins image as the base
FROM jenkins/jenkins:lts

# Switch to the root user
USER root

# Update the package list and install prerequisites
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Add Docker’s official GPG key
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

# Set up the stable Docker repository
RUN echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

# Update the package list again and install Docker
RUN apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io

# Add the Jenkins user to the Docker group
RUN usermod -aG docker jenkins

# Install Docker Compose
RUN curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

# Switch back to the Jenkins user
USER jenkins

# Expose Jenkins port
EXPOSE 8080

# Set the entry point to Jenkins with Tini
ENTRYPOINT ["/usr/bin/tini", "--", "/usr/local/bin/jenkins.sh"]
