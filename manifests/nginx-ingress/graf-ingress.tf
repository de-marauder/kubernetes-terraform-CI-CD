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
