# Enable the Vault UI
ui = true

# Disable mlock (OK for containers and non-sensitive dev environments)
disable_mlock = true

# Use file-based storage
storage "file" {
  path = "/vault/data"
}

# Listener without TLS (since your host terminates TLS)
listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_disable = true
}

# API address for client communication
api_addr = "http://localhost:8200"
