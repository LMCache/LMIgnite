Launch LMIgnite Web Interface
=============================

📹 See demo video

.. raw:: html

   <div style="max-width: 560px;">
     <iframe width="560" height="315"
       src="https://www.youtube.com/embed/w_0Ruwk5IyY"
       title="YouTube video player"
       frameborder="0"
       allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
       allowfullscreen>
     </iframe>
   </div>

1. Clone the repo
-----------------

.. code-block:: bash

   # via HTTPS
   git clone https://github.com/LMCache/one-click-deployment.git
   # or via SSH
   git clone git@github.com:LMCache/one-click-deployment.git

   cd one-click-deployment

2. Launch LMIgnite Web Interface
--------------------------------

Set your Lambda Labs API key and start the app in your shell:

.. code-block:: bash

   LAMBDA_LABS_API_KEY=<YOUR_LAMBDA_LABS_API_KEY> docker compose up

Open http://localhost:3001 in your browser after seeing the following log:

.. code-block:: csharp

   app-1       | [Nest] 18  - 07/10/2025, 6:48:08 AM     LOG [NestApplication] Nest application successfully started +169ms
   app-1       | NestJS backend is running on: http://localhost:3001
   app-1       | Swagger documentation available at: http://localhost:3001/api/docs
   app-1       | Environment: production

Tips
----

* If port 3001 is in use, you can change it in ``docker-compose.yml``. 