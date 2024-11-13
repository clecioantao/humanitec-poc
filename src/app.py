from datetime import datetime
from flask import Flask, jsonify

current_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
message = f"Hello, Humanitec! Realizando POC de deploy com Humanitec em {current_time}"

app = Flask(__name__)

@app.route('/')
def index():
    return jsonify({"message": message})

@app.route('/health')
def health():
    return jsonify({"status": "healthy"})

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080)
