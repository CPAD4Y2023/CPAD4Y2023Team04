# Importing flask module in the project is mandatory
# An object of Flask class is our WSGI application.
from flask import Flask,request
from flow import getDegreeCourses,getCollegeNames,get_courses,get_latest_news,find_jobs,fetchCertifications

# Flask constructor takes the name of
# current module (__name__) as argument.
app = Flask(__name__)


@app.route('/')
# ‘/’ URL is bound with hello_world() function.
def hello_world():
	return 'Hello World'


@app.route('/v1/degreeCourses')
def suggest_degree_courses():
      hobbies = request.args.get("hobbies")
      skills = request.args.get("skills")
      personality = request.args.get("personality")
      return getDegreeCourses(hobbies, skills, personality).replace("\n","").split("- ")[1:]

@app.route('/v1/colleges')
def suggested_colleges():
      subject = request.args.get("subject")
      return getCollegeNames(subject).replace("\n","").split("- ")[1:]

@app.route('/v1/course')
def suggested_courses():
      skills = request.args.get("skills")
      return get_courses(skills)

@app.route('/v1/certifications')
def suggested_certifications():
      skills = request.args.get("skills")
      return fetchCertifications(skills).replace("\n","").split("- ")[1:]

@app.route('/v1/latestNews')
def fetch_latest_news():
      skills = request.args.get("topics")
      return get_latest_news(skills)

@app.route('/v1/jobs')
def fetch_jobs():
      skills = request.args.get("skills")
      return find_jobs(skills)


    

# main driver function
if __name__ == '__main__':

	# run() method of Flask class runs the application
	# on the local development server.
    app.run(host='0.0.0.0', port=8080)