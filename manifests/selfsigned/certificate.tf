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
