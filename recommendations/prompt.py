import os
import openai
openai.api_type = "azure"
openai.api_version = "2023-05-15" 
# openai.api_base =  "/" # Your Azure OpenAI resource's endpoint value.
# openai.api_key = ""
import json


with open(r'config.json') as config_file:
    config_details = json.load(config_file)

with open(r'.key') as key_file:
    key_details = json.load(key_file)



# This is set to `azure`
openai.api_type = "azure"
# Currently OPENAI API have the following versions available: 2022-12-01
openai.api_version = config_details['OPENAI_API_VERSION']

# The API key for your Azure OpenAI resource.
openai.api_key = key_details["OPENAI_API_KEY"] #os.getenv("OPENAI_API_KEY")

# The base URL for your Azure OpenAI resource. e.g. "https://<your resource name>.openai.azure.com"
openai.api_base = config_details['OPENAI_API_BASE']





def fetch_answer(prompt):
    response = openai.ChatCompletion.create(
        engine="gpt-35-turbo", # The deployment name you chose when you deployed the ChatGPT or GPT-4 model.
        temperature=0,
        n=1,
        top_p=0,
        messages=[
            
            {"role": "user", "content": prompt},
            
        ]
    )

    return response['choices'][0]['message']['content']
