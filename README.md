# LMIgnite: Host Your LLMs Everywhere

**Deploy production-ready LLM infra to any cloud with just a web browser.**

LMIgnite is your one-stop solution for deploying high-performance, enterprise-grade LLM serving infrastructure. Whether you're a developer building AI applications or an enterprise scaling LLM services, we make it simple to get started while delivering production-ready performance.

## What Makes LMIgnite Special?

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
- 🔧 **One-click deployment** across clouds such as AWS, GCP, Azure, and Lambda, plus on-premises
- 📊 **Built-in monitoring** and performance analytics
- 🔒 **Production security** with enterprise-grade features

## Prerequisites

Before you begin, make sure you have the following requirements installed and configured:

1. **Docker** installed on your local laptop
2. **Lambda Labs API key** for cloud GPU instances
3. **Hugging Face access token** for model access

Visit the the [documentation](https://docs.tensormesh.ai/quickstart/prerequisites.html) for more details

## Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/LMCache/LMIgnite.git

cd LMIgnite/
```

### 2. Launch the Web Interface

Set your Lambda Labs API key and start the application:

```bash
LAMBDA_LABS_API_KEY=<YOUR_LAMBDA_LABS_API_KEY> docker compose up
```

Open `http://localhost:3001` in your browser after seeing the following log:

```plaintext
app-1       | NestJS backend is running on: http://localhost:3001
app-1       | Swagger documentation available at: http://localhost:3001/api/docs
```

### 3. Create a Cluster

1. In the left sidebar, click **Cluster**, then hit **+ Create Cluster**
2. Fill in Cluster Configuration:
   - Name (e.g., test)
   - Cloud Provider (e.g., Lambda Labs)
   - Region (e.g., us-south-1)
   - GPU Type & Count (e.g., 8 × H100)
   - Hugging Face Token (paste your HF access token)
3. Click **Create Cluster** at the bottom right
4. Wait until the status shows **Active** (Pending → init → wait_k8s → Active)

### 4. Create Deployments

1. In the left sidebar, click **Deployments**, then hit **+ Create Deployment**
2. Search or select from existing model cards (e.g., meta-llama/Llama-3.2-1B-Instruct)
3. Configure basics:
   - Deployment Name: give it a descriptive name (e.g., llama-8b-test)
   - Target Cluster: select one of your Active clusters
4. Click **Create Deployment** to quick-start, or **Next: Advanced** for fine control
5. Monitor the deployment status progression

## Advanced Features

LMIgnite provides comprehensive enterprise-grade features including:

- **Multi-tenancy Support**: Secure isolation and resource management
- **LoRA Support**: Efficient fine-tuning and adaptation capabilities
- **MCP Support**: Model Context Protocol integration
- **Autoscaling**: Dynamic resource allocation based on demand
- **Smart Routing**: Intelligent request distribution and load balancing
- **High Availability**: Built-in redundancy and failover mechanisms
- **Security**: Enterprise-grade security features and compliance

## Platform Support

LMIgnite supports major cloud platforms and orchestration systems:

- **Amazon Web Services (AWS)** - Amazon Elastic Kubernetes Service (EKS)
- **Google Cloud Platform (GCP)** - Google Kubernetes Engine (GKE)
- **Microsoft Azure** - Azure Kubernetes Service (AKS)
- **Lambda Cloud** - Lambda Cloud platform
- **On-Premises and Hybrid** - Kubernetes clusters
- **Other GPU Vendors** - Various GPU providers

## Documentation

For comprehensive documentation, visit our [online documentation](https://docs.tensormesh.ai/) which includes:

- **Overview**: What is LMIgnite, architecture, and key concepts
- **Quick Start**: Step-by-step deployment guide
- **Tutorials**: Detailed walkthroughs and examples

## Tips

- If port 3001 is in use, you can change it in `docker-compose.yml`
- If cluster creation fails, try switching to a different region
- Some models on Hugging Face are "gated" and require access approval
- Check deployment logs if creation fails

## Contributing

We welcome contributions! Please check our documentation for development guidelines.
