from flask import Flask, render_template, request, session
import os
import subprocess
import datetime
import time
from werkzeug.utils import secure_filename

UPLOAD_FOLDER = os.path.join('staticFiles', 'uploads')
ALLOWED_EXTENSIONS = {'txt', 'pdf', 'png', 'jpg', 'jpeg', 'gif'}

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = '/opt/uploaded_images/'
img_filename = 'landing.jpg'

@app.route('/')
def index():
    now = datetime.datetime.now()
    timeString = now.strftime("%I:%M %p")
    path1 = '/var/log/systemuptime.log'
    with open(path1, encoding='utf-8') as data:
        uptimeString=data.read()
    path2 = '/var/log/systemtemp.log'
    with open(path2, encoding='utf-8') as data:
        tempString=data.read()
    path3 = '/var/log/gameboxcommit.log'
    with open(path3, encoding='utf-8') as data:
        versionString=data.read()
    path4 = '/var/log/spaceused.log'
    with open(path4, encoding='utf-8') as data:
        capacityString=data.read()
    templateData = {
       'title' : 'gamebox control panel',
       'time' : timeString,
       'uptime' : uptimeString,
       'temp' : tempString,
       'commit' : versionString,
       'free' : capacityString
       }
    return render_template('index.html', **templateData)
 
@app.route('/',  methods=("POST", "GET"))
def uploadFile():
    if request.method == 'POST':
        uploaded_img = request.files['uploaded-file']
        img_filename = secure_filename(uploaded_img.filename)
        uploaded_img.save(os.path.join('/opt/uploaded_images/', img_filename))
        subprocess.run(['/usr/bin/bash /opt/gamebox-server/scripts/display_image.sh'], shell=True)
        templateData ={
            'task' : 'set image',
            'current' : os.path.join('/opt/uploaded_images/', img_filename)
        }
        return render_template('success.html', **templateData)

@app.route('/reset_image')
def resetImage():
    subprocess.run(['/usr/bin/bash /opt/gamebox-server/scripts/display_image.sh /opt/landing.jpg'], shell=True)
    templateData ={'task' : 'cleared the image'}
    return render_template('success.html', **templateData)

@app.route('/recall_image')
def recallImage():
    subprocess.run(['/usr/bin/bash /opt/gamebox-server/scripts/display_image.sh'], shell=True)
    templateData ={'task' : 'recalled the last image'}
    return render_template('success.html', **templateData)
 
@app.route('/reboot')
def restartSystem():
    subprocess.run(['/usr/bin/bash /opt/gamebox-server/scripts/halt.sh -r'], shell=True)
    templateData ={'task' : 'restarted the system'}
    return render_template('success.html', **templateData)

@app.route('/power_down')
def powerDown():
    subprocess.run(['/usr/bin/bash /opt/gamebox-server/scripts/halt.sh'], shell=True)
    return render_template('done.html')
 
if __name__=='__main__':
    app.run(host='0.0.0.0', port=80, debug=True)
