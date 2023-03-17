resource "kubernetes_manifest" "certificate_vote_app_vote_app_cert" {
  manifest = {
    "apiVersion" = "cert-manager.io/v1"
    "kind" = "Certificate"
    "metadata" = {
      "name" = "vote-app-cert"
      "namespace" = "vote-app"
    }
    "spec" = {
      "dnsNames" = [
        "vote.de-marauder.me",
        "result.de-marauder.me",
      ]
      "issuerRef" = {
        "kind" = "ClusterIssuer"
        "name" = "letsencrypt-cluster-issuer"
      }
      "secretName" = "vote-app-tls"
    }
  }
}

resource "kubernetes_manifest" "certificate_sock_shop_sock_shop_cert" {
  manifest = {
    "apiVersion" = "cert-manager.io/v1"
    "kind" = "Certificate"
    "metadata" = {
      "name" = "sock-shop-cert"
      "namespace" = "sock-shop"
    }
    "spec" = {
      "dnsNames" = [
        "sock.de-marauder.me",
      ]
      "issuerRef" = {
        "kind" = "ClusterIssuer"
        "name" = "letsencrypt-cluster-issuer"
      }
      "secretName" = "sock-shop-tls"
    }
  }
}

resource "kubernetes_manifest" "certificate_monitoring_prometheus_cert" {
  manifest = {
    "apiVersion" = "cert-manager.io/v1"
    "kind" = "Certificate"
    "metadata" = {
      "name" = "prometheus-cert"
      "namespace" = "monitoring"
    }
    "spec" = {
      "dnsNames" = [
        "prom.de-marauder.me",
      ]
      "issuerRef" = {
        "kind" = "ClusterIssuer"
        "name" = "letsencrypt-cluster-issuer"
      }
      "secretName" = "prometheus-server-tls"
    }
  }
}

resource "kubernetes_manifest" "certificate_monitoring_grafana_cert" {
  manifest = {
    "apiVersion" = "cert-manager.io/v1"
    "kind" = "Certificate"
    "metadata" = {
      "name" = "grafana-cert"
      "namespace" = "monitoring"
    }
    "spec" = {
      "dnsNames" = [
        "grafana.de-marauder.me",
      ]
      "issuerRef" = {
        "kind" = "ClusterIssuer"
        "name" = "letsencrypt-cluster-issuer"
      }
      "secretName" = "grafana-server-tls"
    }
  }
}
