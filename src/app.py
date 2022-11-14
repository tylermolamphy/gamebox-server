from flask import Flask, render_template, request, session
import os
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
    return render_template('main.html')
 
@app.route('/',  methods=("POST", "GET"))
def uploadFile():
    if request.method == 'POST':
        # Upload file flask
        uploaded_img = request.files['uploaded-file']
        # Extracting uploaded data file name
        img_filename = secure_filename(uploaded_img.filename)
        # Upload file to database (defined uploaded folder in static path)
        uploaded_img.save(os.path.join('/opt/uploaded_images/', img_filename))
        # Storing uploaded file path in flask session
        session['uploaded_img_file_path'] = (os.path.join('/opt/uploaded_images/', img_filename))
        # And displaying image
        uploaded_img.run(['./fbi.sh', (os.path.join('/opt/uploaded_images/', img_filename))], shell=True)
        # Finally, return to user
        return render_template('success.html')
 
@app.route('/show_image')
def displayImage():
    # Retrieving uploaded file path from session
    img_file_path = session.get('uploaded_img_file_path', None)
    # Display image in Flask application web page
    return render_template('show_image.html', user_image = img_file_path)
 
if __name__=='__main__':
    app.run(host='0.0.0.0', port=80, debug=True)
