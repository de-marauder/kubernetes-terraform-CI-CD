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
