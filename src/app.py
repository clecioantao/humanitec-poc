from datetime import datetime
from flask import Flask, jsonify

current_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

app = Flask(__name__)

@app.route('/')
def index():
    return jsonify({"message": "Hello, Humanitec! Realizando POC de deploy com Humanitec - XXXXX "})

@app.route('/health')
def health():
    return jsonify({"status": "healthy"})

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080)
