import requests
from bs4 import BeautifulSoup

def scrape_tech_news():
    # Define the URL of the news website
    url = 'https://www.gadgetsnow.com/tech-news?utm_source=toiweb&utm_medium=referral&utm_campaign=toiweb_hptopnav&_gl=1*138y5ht*_ga*NzAzODYzNTY0LjE2ODU3MDQ3OTQ.*_ga_FCN624MN68*MTY4NTcwNDg1MC4xLjEuMTY4NTcwNDg3OC4zMi4wLjA.'  # Replace with the actual news website URL

    # Send a GET request to the URL
    response = requests.get(url)

    # Parse the HTML content using BeautifulSoup
    soup = BeautifulSoup(response.content, 'html.parser')
    entries =  [{"text" : item.text.split(" Tech News")[1],"link" : item.next.attrs.get('href'), "type" : "technology"} for item in soup.find_all("div", {"class": "gXWlF _3IvxE _3bMre"})]
    return entries

def scrape_sports_news():
    # Define the URL of the news website
    url = 'https://www.espn.in/'  # Replace with the actual news website URL

    # Send a GET request to the URL
    response = requests.get(url)

    # Parse the HTML content using BeautifulSoup
    soup = BeautifulSoup(response.content, 'html.parser')
    entries =  [item.text for item in soup.find_all('div', class_='contentItem__contentWrapper')]
    answer = []
    for entry in entries:
        answer.append({"text": entry, "link" :"https://www.espn.in/" , "type" : "sports"})
    return answer

def scrape_finance_news():
    # Define the URL of the news website
    url = 'https://economictimes.indiatimes.com/?from=mdr'  # Replace with the actual news website URL

    # Send a GET request to the URL
    response = requests.get(url)

    # Parse the HTML content using BeautifulSoup
    soup = BeautifulSoup(response.content, 'html.parser')
    entries =  [{"link": "https://economictimes.indiatimes.com"+item.attrs.get("href"),"text": item.text, "type": "finance"} for item in soup.find_all('a', class_='tle_wrp')]
    return entries



