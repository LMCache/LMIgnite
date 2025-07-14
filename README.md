<h2 align="center">Deploy LLMs to your own cluster & cloud via web browser</h1>

LMIgnite ignites your cluster with LLM deployments. It is your one-click solution to deploy high-performance, enterprise-grade LLM serving infrastructure into cloud environments and your own cluster.

## Why LMIgnite?

LMIgnite is:

- **Self-hosted**: You run your LLM with your own machines. It's cheap and private.
- **High-performance**: We give you the best performance by deeply integrating open-source LLM projects, including inference engine ([vLLM](https://github.com/vllm-project/vllm) ![GitHub Repo stars](https://img.shields.io/github/stars/vllm-project/vllm?style=social)), inter-inference-engine communication ([LMCache](https://github.com/LMCache/LMCache) ![GitHub Repo stars](https://img.shields.io/github/stars/LMCache/LMCache?style=social)) and production-level orchestration ([vLLM production stack](https://github.com/vllm-project/production-stack) ![GitHub Repo stars](https://img.shields.io/github/stars/vllm-project/production-stack?style=social)).

Feature highlights:

- 🌐 **Easy-to-use**: Deploy LLMs **just by your browser**.
- 🚀 **One-click runnable**: Run the bash script, and the webpage for LLM deployment will pop up for you.
- ⚡  **3-10x faster response times** through our own communication library ([LMCache](https://github.com/LMCache/LMCache) ![GitHub Repo stars](https://img.shields.io/github/stars/LMCache/LMCache?style=social)) and orchestration library ([vLLM production stack](https://github.com/vllm-project/production-stack) ![GitHub Repo stars](https://img.shields.io/github/stars/vllm-project/production-stack?style=social)).
- 🏢 **Enterprise-ready** with multi-tenancy, autoscaling, and high availability
- 🔧 **Wide support** across clouds such as AWS, GCP, Azure, and Lambda, plus on-premises
- 📊 **Built-in monitoring** and performance analytics

## Prerequisites

Before you begin, make sure you have the following:

1. **Lambda Labs API key** to connect to Lambda Cloud (the support for other clouds and self-host Kubernetes cluster is coming soon!)
2. **Hugging Face access token** for model access

Visit the [documentation](https://docs.tensormesh.ai/quickstart/prerequisites.html) on how to get them.

Currently, we support **MacOS** with automatic dependency installation. For users with **other OS (Windows/Linux)**, you may need to install `docker compose` manually before using the following one-click script.


## Quick Start


### 1. Run the one-click installation script


#### Video tutorial:

[![Install LMIgnite](http://img.youtube.com/vi/Xealh5eEnx4/0.jpg)](http://www.youtube.com/watch?v=Xealh5eEnx4 "Install LMIgnite")


(Make sure you have lambda API key and huggingface token in hand)

Hit `Command(⌘) + Space` on your keyboard, and type `terminal` (or other terminal that you like), and then hit enter to launch the terminal.

Then, simply copy and paste the following command to your terminal

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/LMCache/LMIgnite/refs/heads/main/install.command)
```

This script will guide you through the installation process, and will pop up a browser for you to deploy LLMs in your own cloud!

### 2. Create a Cluster


#### Video tutorial:

[![Create cluster and deploy LLMs](http://img.youtube.com/vi/ykCBRNhVlcE/0.jpg)](http://www.youtube.com/watch?v=ykCBRNhVlcE "Create cluster and deploy LLMs")

1. In the left sidebar, click **Cluster**, then hit **+ Create Cluster**
2. Fill in Cluster Configuration:
   - Name (e.g., test)
   - Cloud Provider (e.g., Lambda Labs)
   - Region (e.g., us-south-1)
   - GPU Type & Count (e.g., 8 × H100)
   - Hugging Face Token (paste your HF access token)
3. Click **Create Cluster** at the bottom right
4. Wait until the status shows **Active** (Pending → init → wait_k8s → Active)

### 3. Create Deployments

#### Video tutorial:

[![Create cluster and deploy LLMs](http://img.youtube.com/vi/ykCBRNhVlcE/0.jpg)](http://www.youtube.com/watch?v=ykCBRNhVlcE "Create cluster and deploy LLMs")

1. In the left sidebar, click **Deployments**, then hit **+ Create Deployment**
2. Search or select from existing model cards (e.g., meta-llama/Llama-3.2-1B-Instruct)
3. Configure basics:
   - Deployment Name: give it a descriptive name (e.g., llama-8b-test)
   - Target Cluster: select one of your Active clusters
4. Click **Create Deployment** to quick-start, or **Next: Advanced** for fine control
5. Monitor the deployment status progression

### 4. Play with your deployment

TBD: include the chatting and the curl request section in README and examples.

## Documentation

Check our [online documentation](https://docs.tensormesh.ai/) for detailed explanations!

## Tips

- If port 3001 is in use, you can change it in `docker-compose.yml`
- If cluster creation fails, try switching to a different region
- Some models on Hugging Face are "gated" and require access approval
- Check deployment logs if creation fails

## Contributing

We welcome contributions! Please check our documentation for development guidelines.
