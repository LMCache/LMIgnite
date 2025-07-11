Deploy Model
============

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

1. Create a Cluster
-------------------

.. note::
   Provisioning resources can take time. You may need to wait up to **20 minutes** for Lambda to provide GPUs.

* In the left sidebar, click **Cluster**, then hit **+ Create Cluster**.
* Fill in Cluster Configuration:

  * Name (e.g. test)
  * Cloud Provider (e.g. Lambda Labs)
  * Region (e.g. us-south-1)
  * GPU Type & Count (e.g. 8 × H100)
  * Hugging Face Token (paste your HF access token)

* Click **Create Cluster** at the bottom right.
* You will see an info card containing status progression: **Pending → init → wait_k8s → Active**. Wait until the status shows **Active**.

.. note::
   If it turns **Fail to create**, the instance wasn't available.

   * Delete the cluster in the web interface (no need to delete the instance from the Lambda Labs dashboard).
   * Change the configuration and try again. Most often, switching to a different region helps.

2. Create Deployments
---------------------

.. note::
   The deployment process itself could take up to **10 minutes** to complete.

* In the left sidebar, click **Deployments**, then hit **+ Create Deployment**.
* Search or select from existing model cards, pick the model you want to deploy (e.g. meta-llama/Llama-3.2-1B-Instruct).
* Configure basics

  * Deployment Name: give it a descriptive name (e.g. llama-8b-test).
  * Target Cluster: select one of your Active clusters.
  * The UI will auto-detect available GPUs and memory in that cluster.

* Skip—or dive into—Advanced

  * To quick-start, click **Create Deployment** now.
  * For finer control, click **Next: Advanced**. Advanced settings are grouped in three tabs:

    * 🧠 LM Cache

      * CPU/Disk Offloading Buffer Size, P/D Disaggregation, CacheBlend, etc.

    * 🤖 Model

      * Max Model Length, Max Number of Sequences, Dtype, etc.

    * ⚡️ vLLM

      * TP Size, GPU Memory Utilization, Enable Chunked Prefill, etc.

* Launch!

  * Once you click **Create Deployment**, you'll see an info card for your deployment containing status progression.
  * If it fails, check logs.

Tips
---- 