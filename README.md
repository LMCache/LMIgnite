# LMIgnite: Deploy production-ready LLM infra to any cloud using just a web browser.


LMIgnite ignites your cluster with LLM deployments. It is your one-click solution for high-performance, enterprise-grade LLM serving infrastructure.


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

Before you begin, make sure you have the following requirements installed and configured:

1. **MacOS laptop**
2. **Lambda Labs API key** to connect to Lambda Cloud (the support for other clouds and self-host Kubernetes cluster is coming soon!)
3. **Hugging Face access token** for model access

**OS Support:**
- **MacOS**: Full support with automatic dependency installation
- **Other OS (Windows/Linux)**: Supported if you have `docker compose` installed manually

Visit the [documentation](https://docs.tensormesh.ai/quickstart/prerequisites.html) on how to get them.

## Quick Start

### 1. Run the one-click installation script

(Make sure you have lambda API key and huggingface token in hand)

Hit `Command(⌘) + Space` on your keyboard, and type `terminal` (or other terminal that you like), and then hit enter to launch the terminal.

Then, simply copy and paste the following command to your terminal

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/LMCache/LMIgnite/refs/heads/main/install.command)
```

This script will guide you through the installation process, and will pop up a browser for you to deploy LLMs in your own cloud!


### 2. Create a Cluster

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
