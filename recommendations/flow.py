from prompt import fetch_answer
from scraper import scrape_tech_news,scrape_sports_news,scrape_finance_news
from jobs_scraper import scrape_jobs
import random





def getDegreeCourses(hobbies,skills,personality):
    prompt = '''what college degree course should a person with <personality> personality type who likes <hobbies> and is good at <skills> pursue? 
    Degree courses such as Bachelors in Computer Application, Bachelors of Arts, Journalism, PSE(Psychology, Sociology,English) and so on.
    Answer in the format: 
    - degree course 1   
    - degree course 2
    - degree course 3 
    without adding any extra text but add as many degree course names required'''
    prompt = prompt.replace("<hobbies>", hobbies).replace("<personality>", personality).replace("<skills>", skills)
    answer = fetch_answer(prompt)
    return answer

def getCollegeNames(subject_name):
    prompt = '''which is the best college to pursue <subject> in India?
    Answer in the format:
    - College 1
    - College 2
    - College 3
    without adding any extra text but add as many college names as required
    '''
    prompt = prompt.replace("<subject>", subject_name)
    answer = fetch_answer(prompt)
    return answer

def get_courses(skill):
    prompt = '''Suggest some courses along with the links for me to improve my skill on <skill>
    Answer in the format:
    - Course: Course Name. Link: Link
    - Course: Course Name. Link: Link
    - Course: Course Name. Link: Link
    without adding any additional text but add as many course names as required.
    '''
    prompt = prompt.replace("<skill>", skill)
    answer = fetch_answer(prompt)
    answer = answer.split("Course: ")
    courses = []
    for entry in answer:
        if "Link:" in entry:
            sep = entry.replace("\n-","").split("Link:")
            courses.append({"Course": sep[0], "Link" : sep[1]})

    return courses

def fetchCertifications(skills):
    prompt = '''what certification course should a person with <skills> pursue? 
    Certification such as Cisco Certified Network Associate, AWS Cloud Practitioner, Google cloud digital leader
    Answer in the format: 
    - certification 1   
    - certification 2
    - certification 3 
    without adding any extra text but add atleast 5 certifications'''
    prompt = prompt.replace("<skills>", skills)
    answer = fetch_answer(prompt)
    return answer

def find_jobs(skills):
    # skills=skills.replace(' ','').replace(",","-")
    
    return scrape_jobs(skills)
    

def get_latest_news(skills):
    answer = []
    if "tech"  in skills.lower():
        answer.extend(scrape_tech_news())
    if "sport"  in skills.lower():
        answer.extend(scrape_sports_news())
    if "finance"  in skills.lower():
        answer.extend(scrape_finance_news())

    random.shuffle(answer)
    return answer




