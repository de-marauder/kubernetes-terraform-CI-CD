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
                      "number" = 9090
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
