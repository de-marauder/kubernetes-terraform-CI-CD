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
