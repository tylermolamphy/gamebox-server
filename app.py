from flask import Flask, render_template, request, session
import os
import subprocess
import datetime
import time
from werkzeug.utils import secure_filename

UPLOAD_FOLDER = os.path.join('staticFiles', 'uploads')
ALLOWED_EXTENSIONS = {'txt', 'pdf', 'png', 'jpg', 'jpeg', 'gif'}

app = Flask(__name__, template_folder='templateFiles', static_folder='staticFiles')
app.config['UPLOAD_FOLDER'] = '/opt/uploaded_images/'
 
app = Flask(__name__)
app.config['SESSION_TYPE'] = 'memcached'
app.config['SECRET_KEY'] = 'c41FRlse6dhmD2zr52kdfTDAgtNejXjKDoQyCUiHXo7YeR'
 
@app.route('/')
def index():
    now = datetime.datetime.now()
    timeString = now.strftime("%Y-%m-%d %H:%M")
    templateData = {
       'title' : 'HELLO!',
       'time': timeString
       }
    return render_template('main.html', **templateData)
 
@app.route('/',  methods=("POST", "GET"))
def uploadFile():
    if request.method == 'POST':
        # Upload file flask
        uploaded_img = request.files['uploaded-file']
        # Extracting uploaded data file name
        img_filename = secure_filename(uploaded_img.filename)
        # Upload file to database (defined uploaded folder in static path)
        uploaded_img.save(os.path.join('/opt/uploaded_images/', img_filename))
        # And displaying image
        subprocess.run(['/usr/bin/bash /opt/display_image.sh'], shell=True)
        # Finally, return to user
        return render_template('success.html')
 
@app.route('/reset_image')
def resetImage():
    # Retrieving uploaded file path from session
    subprocess.run(['/usr/bin/bash /opt/display_image.sh /opt/landing.jpg'], shell=True)
    # Display image in Flask application web page
    return render_template('success.html')
 
@app.route('/power_down')
def powerDown():
    # Retrieving uploaded file path from session
    subprocess.run(['/usr/bin/bash poweroff'], shell=True)
    # Display image in Flask application web page
    return render_template('success.html')
 
if __name__=='__main__':
    app.run(host='0.0.0.0', port=80, debug=True)
