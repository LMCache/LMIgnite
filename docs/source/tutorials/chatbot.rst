Chatbot Integration
===================

Learn how to integrate LMIgnite with your chatbot application using the endpoint and API key from the LMIgnite UI.

Getting Started with Chatbot Integration
----------------------------------------

Once you have obtained your endpoint URL and API key from the LMIgnite web interface, you can easily integrate caching into your chatbot application. The following tutorial demonstrates how to set up a simple chatbot that leverages LMIgnite for improved response times and reduced API costs.

.. raw:: html

   <div style="text-align: center; margin: 20px 0;">
       <p><strong>Video Tutorial</strong></p>
       <p><em>[Video placeholder - will be added soon]</em></p>
   </div>

Basic Chatbot Setup
-------------------

Here's a simple example of how to create a chatbot using your LMIgnite endpoint:

.. code-block:: python

   import requests
   import json

   class LMCacheChatbot:
       def __init__(self, endpoint_url, api_key):
           self.endpoint_url = endpoint_url
           self.api_key = api_key
           self.headers = {
               'Authorization': f'Bearer {api_key}',
               'Content-Type': 'application/json'
           }
       
       def send_message(self, message, model="gpt-3.5-turbo"):
           payload = {
               'model': model,
               'messages': [{'role': 'user', 'content': message}],
               'cache_enabled': True
           }
           
           response = requests.post(
               f"{self.endpoint_url}/chat/completions",
               headers=self.headers,
               json=payload
           )
           
           if response.status_code == 200:
               return response.json()['choices'][0]['message']['content']
           else:
               return f"Error: {response.status_code}"

   # Usage example
   chatbot = LMCacheChatbot(
       endpoint_url="YOUR_LMCACHE_ENDPOINT", 
       api_key="YOUR_API_KEY"
   )
   
   response = chatbot.send_message("Hello, how can you help me today?")
   print(response) 