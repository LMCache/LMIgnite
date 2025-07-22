<p align="center">
  <img src="docs/icon.jpg" alt="LMIgnite Logo" width="50%">
</p>
<h2 align="center">Deploy LLMs to your own cluster & cloud via web browser</h2>

LMIgnite sets your cluster on fire with LLM deployments. It's your one-click solution for deploying high-performance, enterprise-grade LLM serving infrastructure to your own cluster and cloud environments.

## Why LMIgnite?

LMIgnite is:

- **Self-hosted**: You run your LLM with your own machines (real or virtual). It's cheap and private.
- **High-performance**: We give you the best performance by deeply integrating open-source LLM projects, including inference engine ([vLLM](https://github.com/vllm-project/vllm) ![GitHub Repo stars](https://img.shields.io/github/stars/vllm-project/vllm?style=social)), inter-inference-engine communication ([LMCache](https://github.com/LMCache/LMCache) ![GitHub Repo stars](https://img.shields.io/github/stars/LMCache/LMCache?style=social)) and production-level orchestration ([vLLM production stack](https://github.com/vllm-project/production-stack) ![GitHub Repo stars](https://img.shields.io/github/stars/vllm-project/production-stack?style=social)).

**Feature highlights:**

- 🌐 **Easy-to-use**: Deploy LLMs right from your browser.
- 🚀 **One-click runnable**: Run the bash script, and the deployment webpage pops up for you.
- ⚡  **3-10x faster response times** with our own open-source projects ([LMCache](https://github.com/LMCache/LMCache) ![GitHub Repo stars](https://img.shields.io/github/stars/LMCache/LMCache?style=social) and [vLLM production stack](https://github.com/vllm-project/production-stack) ![GitHub Repo stars](https://img.shields.io/github/stars/vllm-project/production-stack?style=social)).
- 🏢 **Enterprise-ready**: Multi-tenancy, autoscaling, and high availability.
- 🔧 **Wide support**: AWS, GCP, Azure, Lambda, and on-premises.
- 📊 **Built-in monitoring** and performance analytics.

## Supported Environments

| Environment        | Status           | Notes                                 |
|--------------------|------------------|---------------------------------------|
| Lambda Labs        | ✅ Available     | Fully supported and tested            |
| NEBIUS             | 🚧 Next Release  | Support coming in the next release    |
| Google GKE         | 🚧 Next Release  | Support coming in the next release    |
| AWS                | 🚧 Planned       | Planned for future support            |
| Azure              | 🚧 Planned       | Planned for future support            |
| RunPod             | 🚧 Planned       | Planned for future support            |
| FluidStack         | 🚧 Planned       | Planned for future support            |
| Paperspace         | 🚧 Planned       | Planned for future support            |
| Local Cluster      | 🚧 Planned       | Planned for future support            |

## Supported OS

LMIgnite runs a browser on your laptop to help you manage the cluster. Currently, we support **macOS** with a one-click script that automatically installs dependencies and launches the browser for you.

For users on **Windows/Linux**, you may need to install `docker compose` manually before using the one-click script below.


## Quick Start

### 1. Run the one-click installation script

**Video tutorial:** [link](http://www.youtube.com/watch?v=Xealh5eEnx4).

On your local laptop, hit `Command(⌘) + Space` on your keyboard, and type `terminal` (or other terminal that you like), and then hit enter to launch the terminal.

Then, copy and paste the following command to your terminal

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/LMCache/LMIgnite/refs/heads/main/install.command)
```

This script will guide you through installation and open a browser for you to deploy LLMs on your own cloud!

### 2. Add secrets to LMIgnite

**Video tutorial:** [link](https://youtu.be/HAK6Evb3SjM).

LMIgnite currently supports two types of secrets:

1. **Lambda Cloud API key** (for connecting to Lambda Cloud; support for other environments is coming soon)
2. (Optional) **Hugging Face access token** (for accessing gated LLM models)

See the [documentation](https://docs.tensormesh.ai/quickstart/prerequisites.html) for how to get these.

To add your secrets:
1. In the left sidebar, click **Secrets**
2. Select **Lambda** and click **Add Secret** to add your Lambda Cloud API key
3. (Optional) Select **Hugging Face** and click **Add Secret** to add your Hugging Face token

### 3. Create a Cluster

**Video tutorial:** [link](https://youtu.be/HAK6Evb3SjM).

1. In the left sidebar, click **Cluster**, then hit **+ Create Cluster**
2. Fill in the Cluster Configuration:
   - Name (e.g., test)
   - Cloud Provider (e.g., Lambda Labs)
   - Region (e.g., us-south-1)
   - GPU Type & Count (e.g., 8 × H100)
3. Click **Create Cluster** at the bottom right
4. Wait until the status shows **Active** (Pending → init → wait_k8s → Active)

### 4. Create Deployments

**Video tutorial:** [link](https://youtu.be/zM-GaE0-ba4).

1. In the left sidebar, click **Deployments**, then hit **+ Create Deployment**
2. Search or select from existing model cards (e.g., meta-llama/Llama-3.1-8B-Instruct)
3. Configure basics:
   - Deployment Name: give it a descriptive name (e.g., llama8b)
   - Target Cluster: select one of your Active clusters
   - (Optional) Hugging Face token: select one of the tokens you previously added in the Secrets section
4. Click **Create Deployment** to quick-start, or **Next: Advanced** for fine control
5. Monitor the deployment status progression

### 5. Play with your deployment

**Video tutorial:** [link](https://youtu.be/zM-GaE0-ba4) (at the end of this video).

We include two things that you can play with:
1. An embedded chatbot interface that allows you to send the prompts and see the responses.
2. An OpenAI-compatible API endpoint URL that you can use to send requests and receive responses in production. 

## Documentation

Check our [online documentation](https://docs.tensormesh.ai/lmignite/) for detailed explanations!

## Tips

- If port 3001 is in use, you can change it in `docker-compose.yml`.
- If cluster creation fails, try switching to a different region.
- Some models on Hugging Face are "gated" and require access approval.
- Check deployment logs if creation fails.

## Contributing

We welcome contributions! Please check our documentation for development guidelines.

## License

This project is licensed under the Apache License, Version 2.0.  
See the [LICENSE](LICENSE) file for details.
