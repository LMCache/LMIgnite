Prerequisites
=============

Before you begin, make sure you have the following ready. These are required to create clusters and access models with LMIgnite:

1. A MacOS laptop (primary support)
2. Lambda Labs API key
3. (Optional) HuggingFace access token

**OS Support:**

- **MacOS**: Full support with automatic dependency installation
- **Other OS (Windows/Linux)**: Supported if you have `docker compose` installed manually

.. note::
  For non-MacOS users, you'll need to install `docker compose` manually before proceeding with the installation.

1. Get a Lambda Labs API Key
----------------------------

To launch and manage cloud GPU instances, you'll need a Lambda Labs API key:

#. Go to https://lambda.ai/ and **Sign Up** (or **Log In** if you already have an account).
#. In the left sidebar, click **API Keys**.
#. Click **Generate API Key**, give it a name, and copy the key (e.g., `secret_xxx`).
#. Save your key somewhere safe—you won't be able to see it again!

2. Get a Hugging Face Access Token
----------------------------------

To access models from the Hugging Face Hub:

#. Go to https://huggingface.co/login and **Sign Up** (or **Log In**).
#. Visit https://huggingface.co/settings/tokens.
#. Click **+ Create new token**, choose **Read** as the type, give it a name (e.g., "lmignite"), and click **Create token**.
#. Copy your token (e.g., `hf_xxx`) and save it somewhere safe.

.. note::
   Some models on Hugging Face are "gated" and require you to request access on the model card page. Approval may be automatic or manual.

Done!
-----

Once you have your API key and token, you're ready to proceed!
