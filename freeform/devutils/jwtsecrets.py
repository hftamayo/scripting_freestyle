import secrets

def generate_secret():
    random_bytes = secrets.token_bytes(32)
    return random_bytes.hex()

# Example usage:
if __name__ == "__main__":
    secret = generate_secret()
    print(f"Generated secret: {secret}")
