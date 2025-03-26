# syntax=docker/dockerfile:1

FROM hashicorp/vault:latest

# Copy configuration files
COPY config.hcl /vault/config/config.hcl

# Set Vault environment variables
ENV VAULT_ADDR=http://0.0.0.0:8200
ENV VAULT_API_ADDR=http://localhost:8200

# Expose Vault's HTTP port
EXPOSE 8200

# Create required directories
RUN mkdir -p /vault/data /vault/logs

# Set file permissions
RUN chown -R vault:vault /vault && chmod 700 /vault/data

# Use file-based storage without TLS (TLS handled by host)
CMD ["vault", "server", "-config=/vault/config/config.hcl"]
