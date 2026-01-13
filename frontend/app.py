from flask import Flask
import requests

app = Flask(__name__)

@app.route('/')
def hello():
    # Le Frontend appelle le Backend via le nom du service "backend"
    try:
        response = requests.get('http://backend:5000')
        data = response.text
    except:
        data = "Le backend est inaccessible."
        
    return f"""
    <h1>Application 3-Tiers</h1>
    <p>Frontend (Worker1) a reçu : <b>{data}</b></p>
    """

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)

