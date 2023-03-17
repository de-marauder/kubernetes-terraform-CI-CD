resource "kubernetes_manifest" "ingress_vote_app_voting_app_ingress" {
  manifest = {
    "apiVersion" = "networking.k8s.io/v1"
    "kind" = "Ingress"
    "metadata" = {
      "annotations" = {
        "ingressClassName" = "nginx"
        "kubernetes.io/ingress.class" = "nginx"
        "nginx.ingress.kubernetes.io/rewrite-target" = "/"
      }
      "name" = "voting-app-ingress"
      "namespace" = "vote-app"
    }
    "spec" = {
      "rules" = [
        {
          "host" = "vote.de-marauder.me"
          "http" = {
            "paths" = [
              {
                "backend" = {
                  "service" = {
                    "name" = "vote"
                    "port" = {
                      "number" = 80
                    }
                  }
                }
                "path" = "/"
                "pathType" = "Prefix"
              },
            ]
          }
        },
        {
          "host" = "result.de-marauder.me"
          "http" = {
            "paths" = [
              {
                "backend" = {
                  "service" = {
                    "name" = "result"
                    "port" = {
                      "number" = 80
                    }
                  }
                }
                "path" = "/"
                "pathType" = "Prefix"
              },
            ]
          }
        },
      ]
      "tls" = [
        {
          "hosts" = [
            "result.de-marauder.me",
            "vote.de-marauder.me",
          ]
          "secretName" = "vote-app-tls"
        },
      ]
    }
  }
}

resource "kubernetes_manifest" "ingress_sock_shop_sock_shop_ingress" {
  manifest = {
    "apiVersion" = "networking.k8s.io/v1"
    "kind" = "Ingress"
    "metadata" = {
      "annotations" = {
        "ingressClassName" = "nginx"
        "kubernetes.io/ingress.class" = "nginx"
        "nginx.ingress.kubernetes.io/rewrite-target" = "/"
      }
      "name" = "sock-shop-ingress"
      "namespace" = "sock-shop"
    }
    "spec" = {
      "rules" = [
        {
          "host" = "sock.de-marauder.me"
          "http" = {
            "paths" = [
              {
                "backend" = {
                  "service" = {
                    "name" = "front-end"
                    "port" = {
                      "number" = 80
                    }
                  }
                }
                "path" = "/"
                "pathType" = "Prefix"
              },
            ]
          }
        },
      ]
      "tls" = [
        {
          "hosts" = [
            "sock.de-marauder.me",
          ]
          "secretName" = "sock-shop-tls"
        },
      ]
    }
  }
}

resource "kubernetes_manifest" "ingress_monitoring_prometheus_ingress" {
  manifest = {
    "apiVersion" = "networking.k8s.io/v1"
    "kind" = "Ingress"
    "metadata" = {
      "annotations" = {
        "ingressClassName" = "nginx"
        "kubernetes.io/ingress.class" = "nginx"
        "nginx.ingress.kubernetes.io/rewrite-target" = "/"
      }
      "name" = "prometheus-ingress"
      "namespace" = "monitoring"
    }
    "spec" = {
      "rules" = [
        {
          "host" = "prom.de-marauder.me"
          "http" = {
            "paths" = [
              {
                "backend" = {
                  "service" = {
                    "name" = "monitoring-kube-prometheus-prometheus"
                    "port" = {
                      "number" = 80
                    }
                  }
                }
                "path" = "/"
                "pathType" = "Prefix"
              },
            ]
          }
        },
      ]
      "tls" = [
        {
          "hosts" = [
            "prom.de-marauder.me",
          ]
          "secretName" = "prometheus-server-tls"
        },
      ]
    }
  }
}

resource "kubernetes_manifest" "ingress_monitoring_grafana_ingress" {
  manifest = {
    "apiVersion" = "networking.k8s.io/v1"
    "kind" = "Ingress"
    "metadata" = {
      "annotations" = {
        "ingressClassName" = "nginx"
        "kubernetes.io/ingress.class" = "nginx"
        "nginx.ingress.kubernetes.io/rewrite-target" = "/"
      }
      "name" = "grafana-ingress"
      "namespace" = "monitoring"
    }
    "spec" = {
      "rules" = [
        {
          "host" = "grafana.de-marauder.me"
          "http" = {
            "paths" = [
              {
                "backend" = {
                  "service" = {
                    "name" = "monitoring-grafana"
                    "port" = {
                      "number" = 80
                    }
                  }
                }
                "path" = "/"
                "pathType" = "Prefix"
              },
            ]
          }
        },
      ]
      "tls" = [
        {
          "hosts" = [
            "grafana.de-marauder.me",
          ]
          "secretName" = "grafana-server-tls"
        },
      ]
    }
  }
}
