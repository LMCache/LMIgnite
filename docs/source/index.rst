.. lmignite-docs documentation master file, created by
   sphinx-quickstart on Tue Jul  1 16:41:55 2025.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

LMIgnite Documentation
======================

Welcome to LMIgnite! 🚀
----------------------

**Deploy production-ready LLM infra to any cloud with just a web browser.**

LMIgnite is your one-stop solution for deploying high-performance, enterprise-grade LLM serving infrastructure. Whether you're a developer building AI applications or an enterprise scaling LLM services, we make it simple to get started while delivering production-ready performance.

What Makes LMIgnite Special?
----------------------------

Under the hood, we deliver **best-in-class LLM serving performance** through deep, full-stack integration:

**Core Technologies:**

- **Orchestration**: vLLM production stack for enterprise-scale deployment
- **Inference Engine**: vLLM for high-performance model serving
- **KV Cache Transmission**: LMCache for intelligent caching and 3-10x latency reduction
- **Datacenter GPU Connection**: NIXL, mooncake, and other high-speed interconnects
- **Deployment Optimization**: P/D disaggregation, fault tolerance, shared prefix caching

**Key Benefits:**

- ⚡ **3-10x faster response times** through intelligent KV cache management
- 🏢 **Enterprise-ready** with multi-tenancy, autoscaling, and high availability
- 🔧 **One-click deployment** across AWS, GCP, Azure, and on-premises
- 📊 **Built-in monitoring** and performance analytics
- 🔒 **Production security** with enterprise-grade features

What You'll Learn
-----------------

This documentation will guide you through:

1. **Prerequisites** - Setting up your environment (Docker Compose, cloud API keys, Hugging Face token)
2. **Deployment** - Deploying GPU clusters on your chosen cloud provider
3. **Model Serving** - Deploying and configuring LLMs on your infrastructure
4. **Integration** - Chat with your LLMs through the web UI or OpenAI-compatible API
5. **Monitoring** - Track performance, usage, and system health
6. **Advanced Features** - Multi-tenancy, autoscaling, and enterprise capabilities

Ready to get started? Head to our :doc:`quickstart/index` guide for a step-by-step walkthrough!

.. toctree::
   :maxdepth: 2
   :caption: Contents:

   overview/index
   quickstart/index
   tutorials/index

Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`

