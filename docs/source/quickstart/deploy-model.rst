Deploy Model
============

📹 See demo video

.. raw:: html

   <div style="max-width: 560px;">
     <iframe width="560" height="315"
       src="https://www.youtube.com/embed/zM-GaE0-ba4"
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
* Fill in the Cluster Configuration:
  * Name (e.g., test)
  * Cloud Provider (e.g., Lambda Labs)
  * Region (e.g., us-south-1)
  * GPU Type & Count (e.g., 8 × H100)
  * Hugging Face Token (paste your HF access token)
* Click **Create Cluster** at the bottom right.
* Wait for the status to show **Active** (Pending → init → wait_k8s → Active).

.. note::
   If it turns **Fail to create**, the instance wasn't available.
   * Delete the cluster in the web interface (no need to delete the instance from the Lambda Labs dashboard).
   * Change the configuration and try again. Most often, switching to a different region helps.

2. Create Deployments
---------------------

.. note::
   The deployment process itself could take up to **10 minutes** to complete.

* In the left sidebar, click **Deployments**, then hit **+ Create Deployment**.
* Search or select from existing model cards, and pick the model you want to deploy (e.g., meta-llama/Llama-3.1-8B-Instruct).
* Configure the basics:
  * Deployment Name: give it a descriptive name (e.g., llama-8b-test).
  * Target Cluster: select one of your Active clusters.
  * The UI will auto-detect available GPUs and memory in that cluster.
* (Optional) Click **Next: Advanced** for more control. Advanced settings are grouped in three tabs:
  * 🧠 LM Cache: CPU/Disk Offloading Buffer Size, P/D Disaggregation, CacheBlend, etc.
  * 🤖 Model: Max Model Length, Max Number of Sequences, Dtype, etc.
  * ⚡️ vLLM: TP Size, GPU Memory Utilization, Enable Chunked Prefill, etc.
* Click **Create Deployment** to launch!
* Once you click **Create Deployment**, you'll see an info card for your deployment containing status progression.
* If it fails, check logs for details.

Tips
----

* If port 3001 is in use, you can change it in `docker-compose.yml`.
* If cluster creation fails, try switching to a different region.
* Some models on Hugging Face are "gated" and require HuggingFace token and access approval to use.
* Check deployment logs if creation fails. 