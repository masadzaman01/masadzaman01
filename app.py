from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return "<h1>Deployment Successful!</h1><p>My Python App is running via AWS CodePipeline.</p>"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)