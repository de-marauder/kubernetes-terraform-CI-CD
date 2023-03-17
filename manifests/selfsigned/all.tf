resource "kubernetes_manifest" "namespace_cert_manager_test" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "Namespace"
    "metadata" = {
      "name" = "cert-manager-test"
    }
  }
}

resource "kubernetes_manifest" "certificate_cert_manager_test_selfsigned_cert" {
  manifest = {
    "apiVersion" = "cert-manager.io/v1"
    "kind" = "Certificate"
    "metadata" = {
      "name" = "selfsigned-cert"
      "namespace" = "cert-manager-test"
    }
    "spec" = {
      "dnsNames" = [
        "example.com",
      ]
      "issuerRef" = {
        "name" = "test-selfsigned"
      }
      "secretName" = "selfsigned-cert-tls"
    }
  }
}

resource "kubernetes_manifest" "issuer_cert_manager_test_test_selfsigned" {
  manifest = {
    "apiVersion" = "cert-manager.io/v1"
    "kind" = "Issuer"
    "metadata" = {
      "name" = "test-selfsigned"
      "namespace" = "cert-manager-test"
    }
    "spec" = {
      "selfSigned" = {}
    }
  }
}
