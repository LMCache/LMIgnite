Prerequisites
=============

Before you begin, make sure you have the following requirements installed and configured:

1. Docker installed on your Mac  
2. Lambda Labs API key  
3. Hugging Face access token  

1. Install Docker
-----------------

Docker is required to run the application in a containerized environment.

To install Docker:

#. Go to the official Docker download page: https://docs.docker.com/get-started/
#. In the left sidebar, click **Introduction → Get Docker Desktop**.
#. Depending on your hardware, download the appropriate version (e.g., **Download (Apple Silicon)**).
#. Follow the installation instructions.
#. After Docker starts, you should see the Docker whale icon. Open the Docker Desktop application.
#. To verify Docker is installed correctly:
   - Open the Terminal app and run:

     .. code-block:: bash

        docker --version

   - You should see output like:

     .. code-block:: text

        Server: Docker Desktop 4.43.1 (198352)
         Engine:
          Version:          28.3.0

2. Get a Lambda Labs API Key
----------------------------

You will need a Lambda Labs API key to launch and manage cloud GPU instances.

To generate your API key:

#. Go to https://lambda.ai/ and click **Sign Up** (or **Log In** if you already have an account).
#. After signing in, navigate to the **API Keys** tab in the left sidebar.
#. Click **Generate API Key** and give it a name.
#. Your key will look something like:

   .. code-block:: text

      secret_xxx

#. Be sure to save your key in a safe place. You will not be able to retrieve it again, and you will need to generate a new one if you lose access.

3. Get a Hugging Face Access Token
----------------------------------

You need a Hugging Face token to access models from the Hugging Face Hub.

To create one:

#. Go to https://huggingface.co/login and **Sign Up** (or **Log In** if you already have an account).
#. Then go to: https://huggingface.co/settings/tokens.
#. Click **+ Create new token**, choose the token type **Read**, give it a name (e.g., "lmignite"), and click **Create token**.
#. Your token will look something like:

   .. code-block:: text

      hf_xxx

#. Be sure to save your token somewhere safe. You will not be able to see it again after closing the modal. If you lose it, you’ll need to create a new one.

Done!
-----

Once you've completed these three steps, you're ready to proceed with the rest of the tutorial.
