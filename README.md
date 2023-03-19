# This repo contains all components for the setup of a kubernetes cluster running three separate applications each with their various services. 
The applications include:
- My portfolio: [de-marauder.me](https://de-marauder.me)
- A [voting application](https://github.com/dockersamples/example-voting-app) on [vote-app.de-marauder.me](https://vote-app.de-marauder.me) and [result-app.de-marauder.me](https://result-app.de-marauder.me)
- The [weaveworks sock shop](https://github.com/microservices-demo/microservices-demo) application on [sock-shop.de-marauder.me](https://sock-shop.de-marauder.me)

# Continous Integration & Continous Deployment (CI/CD) 
This was setup using github actions [here](.github/workflows/build.yaml)

# Monitoring and logging
Monitoring and loging were implented using prometheus, grafana and loki
- Prometheus at [prom.de-marauder.me](https://prom.de-marauder.me)
- Grafana at [graf.de-marauder.me](https://graf.de-marauder.me)

# Infrastructure as Code (IAC)
Implemented with terraform and can be viewed [here](https://github.com/de-marauder/tf-kubernetes)
# Results
<img src='images/portfolio.png' alt='portfolio' />
<img src='images/vote-app.png' alt='vote-app' />
<img src='images/result-app.png' alt='result-app' />
<img src='images/sock-shop.png' alt='sock-shop' />
<img src='images/prometheus.png' alt='prometheus' />
<img src='images/grafana.png' alt='grafana' />