Launch LMIgnite App
===================

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

1. Run the one-click installation script
----------------------------------------

Make sure that you have lambda API key and huggingface token in hand, as shown in the :doc:`prerequisites` section.

Hit `Command(⌘) + Space` on your keyboard, and type `terminal` (or other terminal that you like), and then hit enter to launch the terminal.

Then, simply copy and paste the following command to your terminal:

.. code-block:: bash

  bash <(curl -fsSL https://raw.githubusercontent.com/LMCache/LMIgnite/refs/heads/main/install.command)

This script will guide you through the installation process, and will pop up a browser for you to deploy LLMs in your own cloud!

2. Access the LMIgnite App
--------------------------

The script will automatically open your browser to the LMIgnite app. If it doesn't, you can manually open up a browser and access the app at http://localhost:3001.

Tips
----

* If the installation script fails, make sure you have the prerequisites installed as described in the :doc:`prerequisites` section.
* The script will handle all dependencies and setup automatically.
* If you encounter any issues, check the terminal output for error messages. 