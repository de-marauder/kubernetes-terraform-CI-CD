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
