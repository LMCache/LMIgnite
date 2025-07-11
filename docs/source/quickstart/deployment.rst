Deployment
==========

📹 See demo video

.. raw:: html

   <div style="max-width: 560px;">
     <iframe width="560" height="315"
       src="https://www.youtube.com/embed/zB_Az3UbtQ4"
       title="YouTube video player"
       frameborder="0"
       allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
       allowfullscreen>
     </iframe>
   </div>

1. Create a Cluster
-------------------

* In the left sidebar, click **Cluster**, then hit **+ Create Cluster**.
* Fill in Cluster Configuration:

  * Name (e.g. test)
  * Cloud Provider (e.g. Lambda Labs)
  * Region (e.g. us-south-1)
  * GPU Type & Count (e.g. 8 × H100)
  * Hugging Face Token (paste your HF access token)

* Click **Create Cluster** at the bottom right.
* You will see an info card containing status progression: **Pending → init → wait_k8s → Active**. Wait until the status shows **Active**.

If it turns **Fail to create**, the instance wasn't available.

* Delete that cluster in the app.
* Go to your Lambda Labs dashboard and delete the orphaned instance.
* After deleting the cluster, you can change the configuration and try again.

2. Create Deployments
---------------------

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