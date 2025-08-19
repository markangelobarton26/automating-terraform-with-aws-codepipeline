FROM alpine:3.18

# Install required packages
RUN apk add --no-cache \
    bash \
    curl \
    unzip \
    python3 \
    py3-pip \
    openssl \
    git

# Install AWS CLI
RUN pip3 install awscli

# Install Terraform
ARG TERRAFORM_VERSION=1.5.0
RUN curl -fsSL https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o terraform.zip && \
    unzip terraform.zip && \
    mv terraform /usr/local/bin/ && \
    rm terraform.zip

# Create working directory
WORKDIR /demo

# Copy demo files
COPY demo-project/ ./demo-project/
COPY pipeline-infrastructure/ ./pipeline-infrastructure/
COPY docs/ ./docs/
COPY *.md ./
COPY buildspec.yml ./
COPY demo-config.txt ./

# Make scripts executable
RUN find . -name "*.sh" -exec chmod +x {} \;

# Set entrypoint
ENTRYPOINT ["/bin/bash"]