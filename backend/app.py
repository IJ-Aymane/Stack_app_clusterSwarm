from flask import Flask
import redis
import os

app = Flask(__name__)
# Connexion à l'hôte "database" défini dans le stack file
r = redis.Redis(host='database', port=6379, decode_responses=True)

@app.route('/')
def get_count():
    # Incrémente le compteur dans Redis
    count = r.incr('hits')
    return f"Backend (Manager1) dit : Compteur = {count}"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

