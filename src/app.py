from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def index():
    return jsonify({"message": "Hello, Humanitec! Mandou bem Clecio! 12345"})

@app.route('/health')
def health():
    return jsonify({"status": "healthy"})

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080)
