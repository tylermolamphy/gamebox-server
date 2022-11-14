from flask import Flask, render_template
import subprocess
import os
import datetime
import time
app = Flask(__name__)

@app.route("/")
def hello():
   now = datetime.datetime.now()
   timeString = now.strftime("%Y-%m-%d %H:%M")
   templateData = {
      'title' : 'HELLO!',
      'time': timeString
      }
   return render_template('main.html', **templateData)

@app.route("/showimage/")
def omx():
   subprocess.call(['./omxlive.sh'], shell=True)

#@app.route("/omxstop/")
#def omxstop():
#   subprocess.call(['./omxstop.sh'], shell=True)


if __name__ == "__main__":
   app.run(host='0.0.0.0', port=80, debug=True)