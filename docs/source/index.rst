.. lmignite-docs documentation master file, created by
   sphinx-quickstart on Tue Jul  1 16:41:55 2025.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

LMIgnite Overview
=================

.. image:: ../icon.jpg
   :alt: LMIgnite Logo
   :align: center
   :width: 400px

**Deploy LLMs to your own cluster & cloud via web browser 🚀**

LMIgnite ignites your cluster with LLM deployments. It is your one-click solution to deploy high-performance, enterprise-grade LLM serving infrastructure into your own cluster and cloud environments.

Why LMIgnite?
-------------

- **Self-hosted**: You run your LLM with your own machines. It's cheap and private.
- **High-performance**: Deep integration with open-source LLM projects like vLLM, LMCache, and vLLM production stack.
- **Easy-to-use**: Deploy LLMs just by your browser.
- **One-click runnable**: Run the install script and the deployment web UI pops up for you.
- **3-10x faster**: Thanks to LMCache and orchestration optimizations.
- **Enterprise-ready**: Multi-tenancy, autoscaling, high availability.
- **Wide support**: AWS, GCP, Azure, Lambda, and on-premises.
- **Built-in monitoring**: Performance analytics included.

Supported Environments
----------------------

.. list-table::
   :header-rows: 1

   * - Environment
     - Status
     - Notes
   * - Lambda Labs
     - ✅ Available
     - Fully supported and tested
   * - NEBIUS
     - 🚧 Next Release
     - Support coming in the next release
   * - Google GKE
     - 🚧 Next Release
     - Support coming in the next release
   * - AWS
     - 🚧 Planned
     - Planned for future support
   * - Azure
     - 🚧 Planned
     - Planned for future support
   * - RunPod
     - 🚧 Planned
     - Planned for future support
   * - FluidStack
     - 🚧 Planned
     - Planned for future support
   * - Paperspace
     - 🚧 Planned
     - Planned for future support
   * - Local Cluster
     - 🚧 Planned
     - Planned for future support


What You'll Learn
-----------------

This documentation will guide you through:

1. **Prerequisites** – Setting up your environment (Docker Compose, cloud API keys, Hugging Face token)
2. **Installing & Launching LMIgnite** – Running the one-click install script and accessing the web UI
3. **Cluster Creation** – Creating and configuring GPU clusters on your chosen cloud provider
4. **Model Deployment** – Deploying and configuring LLMs on your infrastructure
5. **Chatbot Integration** – Connecting your chatbot application to LMIgnite using the API
6. **Monitoring** – Accessing dashboards to track performance, usage, and system health
7. **Advanced Features** – Multi-tenancy, autoscaling, and enterprise capabilities

Ready to get started? Head to our :doc:`quickstart/index` guide for a step-by-step walkthrough!

---------

.. toctree::
   :maxdepth: 2
   :caption: Contents:

   self
   quickstart/index
   tutorials/index
