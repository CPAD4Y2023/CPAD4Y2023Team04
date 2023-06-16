import requests
from bs4 import BeautifulSoup
def scrape_jobs(skills):
    l=[]
    o={}
    k=[]
    headers={"User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36"}
    # target_url=f'https://www.linkedin.com/jobs/search/?currentJobId=3621256282&geoId=105214831&keywords=Associate%20Developer&location=Bengaluru%2C%20Karnataka%2C%20India&refresh=true'
    target_url  = 'https://www.linkedin.com/jobs-guest/jobs/api/seeMoreJobPostings/search?keywords='+skills+'&location=Bengaluru%2C%20Karnataka%2C%20India&currentJobId=3415227738&start={}'
    for i in range(0,1):

        res = requests.get(target_url.format(i))
        soup=BeautifulSoup(res.text,'html.parser')
        alljobs_on_this_page=soup.find_all("li")
        print(len(alljobs_on_this_page))
        for x in range(0,20):
            try:
                jobid = alljobs_on_this_page[x].find("div",{"class":"base-card"}).get('data-entity-urn').split(":")[3]
                l.append(jobid)
            except:
                pass

    target_url='https://www.linkedin.com/jobs-guest/jobs/api/jobPosting/{}'
    for j in range(0,len(l)):

        o = {}
        resp = requests.get(target_url.format(l[j]))
        soup=BeautifulSoup(resp.text,'html.parser')

        try:
            o["company"]=soup.find("div",{"class":"top-card-layout__card"}).find("a").find("img").get('alt')
        except:
            o["company"]=None

        try:
            o["job-title"]=soup.find("div",{"class":"top-card-layout__entity-info"}).find("a").text.strip()
        except:
            o["job-title"]=None

        try:
            o["level"]=soup.find("ul",{"class":"description__job-criteria-list"}).find("li").text.replace("Seniority level","").strip()
        except:
            o["level"]=None

        try:
            o["link"] = str(soup.find("code",{"id":"dust-var-postOnboardingRedirectUrl"})).split("!--\"")[1].split("\"--")[0]
        except:
            o["link"] = "NA"



        if (o["link"] != "NA"):
            k.append(o)
    return k