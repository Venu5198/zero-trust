from flask import Flask

app = Flask(__name__)

@app.route("/health")
def health():
    return "ok", 200

@app.route("/")
def index():
    return "Secure Python Cloud Run backend", 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)

