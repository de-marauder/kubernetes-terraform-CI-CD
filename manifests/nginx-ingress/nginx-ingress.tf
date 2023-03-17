resource "kubernetes_manifest" "namespace_ingress_nginx" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "Namespace"
    "metadata" = {
      "labels" = {
        "app.kubernetes.io/instance" = "ingress-nginx"
        "app.kubernetes.io/name" = "ingress-nginx"
      }
      "name" = "ingress-nginx"
    }
  }
}

resource "kubernetes_manifest" "serviceaccount_ingress_nginx_ingress_nginx" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "ServiceAccount"
    "metadata" = {
      "labels" = {
        "app.kubernetes.io/component" = "controller"
        "app.kubernetes.io/instance" = "ingress-nginx"
        "app.kubernetes.io/managed-by" = "Helm"
        "app.kubernetes.io/name" = "ingress-nginx"
        "app.kubernetes.io/version" = "0.41.2"
        "helm.sh/chart" = "ingress-nginx-3.10.1"
      }
      "name" = "ingress-nginx"
      "namespace" = "ingress-nginx"
    }
  }
}

resource "kubernetes_manifest" "configmap_ingress_nginx_ingress_nginx_controller" {
  manifest = {
    "apiVersion" = "v1"
    "data" = null
    "kind" = "ConfigMap"
    "metadata" = {
      "labels" = {
        "app.kubernetes.io/component" = "controller"
        "app.kubernetes.io/instance" = "ingress-nginx"
        "app.kubernetes.io/managed-by" = "Helm"
        "app.kubernetes.io/name" = "ingress-nginx"
        "app.kubernetes.io/version" = "0.41.2"
        "helm.sh/chart" = "ingress-nginx-3.10.1"
      }
      "name" = "ingress-nginx-controller"
      "namespace" = "ingress-nginx"
    }
  }
}

resource "kubernetes_manifest" "clusterrole_ingress_nginx" {
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind" = "ClusterRole"
    "metadata" = {
      "labels" = {
        "app.kubernetes.io/instance" = "ingress-nginx"
        "app.kubernetes.io/managed-by" = "Helm"
        "app.kubernetes.io/name" = "ingress-nginx"
        "app.kubernetes.io/version" = "0.41.2"
        "helm.sh/chart" = "ingress-nginx-3.10.1"
      }
      "name" = "ingress-nginx"
    }
    "rules" = [
      {
        "apiGroups" = [
          "",
        ]
        "resources" = [
          "configmaps",
          "endpoints",
          "nodes",
          "pods",
          "secrets",
        ]
        "verbs" = [
          "list",
          "watch",
        ]
      },
      {
        "apiGroups" = [
          "",
        ]
        "resources" = [
          "nodes",
        ]
        "verbs" = [
          "get",
        ]
      },
      {
        "apiGroups" = [
          "",
        ]
        "resources" = [
          "services",
        ]
        "verbs" = [
          "get",
          "list",
          "update",
          "watch",
        ]
      },
      {
        "apiGroups" = [
          "extensions",
          "networking.k8s.io",
        ]
        "resources" = [
          "ingresses",
        ]
        "verbs" = [
          "get",
          "list",
          "watch",
        ]
      },
      {
        "apiGroups" = [
          "",
        ]
        "resources" = [
          "events",
        ]
        "verbs" = [
          "create",
          "patch",
        ]
      },
      {
        "apiGroups" = [
          "extensions",
          "networking.k8s.io",
        ]
        "resources" = [
          "ingresses/status",
        ]
        "verbs" = [
          "update",
        ]
      },
      {
        "apiGroups" = [
          "networking.k8s.io",
        ]
        "resources" = [
          "ingressclasses",
        ]
        "verbs" = [
          "get",
          "list",
          "watch",
        ]
      },
    ]
  }
}

resource "kubernetes_manifest" "clusterrolebinding_ingress_nginx" {
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind" = "ClusterRoleBinding"
    "metadata" = {
      "labels" = {
        "app.kubernetes.io/instance" = "ingress-nginx"
        "app.kubernetes.io/managed-by" = "Helm"
        "app.kubernetes.io/name" = "ingress-nginx"
        "app.kubernetes.io/version" = "0.41.2"
        "helm.sh/chart" = "ingress-nginx-3.10.1"
      }
      "name" = "ingress-nginx"
    }
    "roleRef" = {
      "apiGroup" = "rbac.authorization.k8s.io"
      "kind" = "ClusterRole"
      "name" = "ingress-nginx"
    }
    "subjects" = [
      {
        "kind" = "ServiceAccount"
        "name" = "ingress-nginx"
        "namespace" = "ingress-nginx"
      },
    ]
  }
}

resource "kubernetes_manifest" "role_ingress_nginx_ingress_nginx" {
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind" = "Role"
    "metadata" = {
      "labels" = {
        "app.kubernetes.io/component" = "controller"
        "app.kubernetes.io/instance" = "ingress-nginx"
        "app.kubernetes.io/managed-by" = "Helm"
        "app.kubernetes.io/name" = "ingress-nginx"
        "app.kubernetes.io/version" = "0.41.2"
        "helm.sh/chart" = "ingress-nginx-3.10.1"
      }
      "name" = "ingress-nginx"
      "namespace" = "ingress-nginx"
    }
    "rules" = [
      {
        "apiGroups" = [
          "",
        ]
        "resources" = [
          "namespaces",
        ]
        "verbs" = [
          "get",
        ]
      },
      {
        "apiGroups" = [
          "",
        ]
        "resources" = [
          "configmaps",
          "pods",
          "secrets",
          "endpoints",
        ]
        "verbs" = [
          "get",
          "list",
          "watch",
        ]
      },
      {
        "apiGroups" = [
          "",
        ]
        "resources" = [
          "services",
        ]
        "verbs" = [
          "get",
          "list",
          "update",
          "watch",
        ]
      },
      {
        "apiGroups" = [
          "extensions",
          "networking.k8s.io",
        ]
        "resources" = [
          "ingresses",
        ]
        "verbs" = [
          "get",
          "list",
          "watch",
        ]
      },
      {
        "apiGroups" = [
          "extensions",
          "networking.k8s.io",
        ]
        "resources" = [
          "ingresses/status",
        ]
        "verbs" = [
          "update",
        ]
      },
      {
        "apiGroups" = [
          "networking.k8s.io",
        ]
        "resources" = [
          "ingressclasses",
        ]
        "verbs" = [
          "get",
          "list",
          "watch",
        ]
      },
      {
        "apiGroups" = [
          "",
        ]
        "resourceNames" = [
          "ingress-controller-leader-nginx",
        ]
        "resources" = [
          "configmaps",
        ]
        "verbs" = [
          "get",
          "update",
        ]
      },
      {
        "apiGroups" = [
          "",
        ]
        "resources" = [
          "configmaps",
        ]
        "verbs" = [
          "create",
        ]
      },
      {
        "apiGroups" = [
          "",
        ]
        "resources" = [
          "endpoints",
        ]
        "verbs" = [
          "create",
          "get",
          "update",
        ]
      },
      {
        "apiGroups" = [
          "",
        ]
        "resources" = [
          "events",
        ]
        "verbs" = [
          "create",
          "patch",
        ]
      },
    ]
  }
}

resource "kubernetes_manifest" "rolebinding_ingress_nginx_ingress_nginx" {
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind" = "RoleBinding"
    "metadata" = {
      "labels" = {
        "app.kubernetes.io/component" = "controller"
        "app.kubernetes.io/instance" = "ingress-nginx"
        "app.kubernetes.io/managed-by" = "Helm"
        "app.kubernetes.io/name" = "ingress-nginx"
        "app.kubernetes.io/version" = "0.41.2"
        "helm.sh/chart" = "ingress-nginx-3.10.1"
      }
      "name" = "ingress-nginx"
      "namespace" = "ingress-nginx"
    }
    "roleRef" = {
      "apiGroup" = "rbac.authorization.k8s.io"
      "kind" = "Role"
      "name" = "ingress-nginx"
    }
    "subjects" = [
      {
        "kind" = "ServiceAccount"
        "name" = "ingress-nginx"
        "namespace" = "ingress-nginx"
      },
    ]
  }
}

resource "kubernetes_manifest" "service_ingress_nginx_ingress_nginx_controller_admission" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "Service"
    "metadata" = {
      "labels" = {
        "app.kubernetes.io/component" = "controller"
        "app.kubernetes.io/instance" = "ingress-nginx"
        "app.kubernetes.io/managed-by" = "Helm"
        "app.kubernetes.io/name" = "ingress-nginx"
        "app.kubernetes.io/version" = "0.41.2"
        "helm.sh/chart" = "ingress-nginx-3.10.1"
      }
      "name" = "ingress-nginx-controller-admission"
      "namespace" = "ingress-nginx"
    }
    "spec" = {
      "ports" = [
        {
          "name" = "https-webhook"
          "port" = 443
          "targetPort" = "webhook"
        },
      ]
      "selector" = {
        "app.kubernetes.io/component" = "controller"
        "app.kubernetes.io/instance" = "ingress-nginx"
        "app.kubernetes.io/name" = "ingress-nginx"
      }
      "type" = "ClusterIP"
    }
  }
}

resource "kubernetes_manifest" "service_ingress_nginx_ingress_nginx_controller" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "Service"
    "metadata" = {
      "annotations" = null
      "labels" = {
        "app.kubernetes.io/component" = "controller"
        "app.kubernetes.io/instance" = "ingress-nginx"
        "app.kubernetes.io/managed-by" = "Helm"
        "app.kubernetes.io/name" = "ingress-nginx"
        "app.kubernetes.io/version" = "0.41.2"
        "helm.sh/chart" = "ingress-nginx-3.10.1"
      }
      "name" = "ingress-nginx-controller"
      "namespace" = "ingress-nginx"
    }
    "spec" = {
      "externalTrafficPolicy" = "Local"
      "ports" = [
        {
          "name" = "http"
          "port" = 80
          "protocol" = "TCP"
          "targetPort" = "http"
        },
        {
          "name" = "https"
          "port" = 443
          "protocol" = "TCP"
          "targetPort" = "https"
        },
      ]
      "selector" = {
        "app.kubernetes.io/component" = "controller"
        "app.kubernetes.io/instance" = "ingress-nginx"
        "app.kubernetes.io/name" = "ingress-nginx"
      }
      "type" = "LoadBalancer"
    }
  }
}

resource "kubernetes_manifest" "deployment_ingress_nginx_ingress_nginx_controller" {
  manifest = {
    "apiVersion" = "apps/v1"
    "kind" = "Deployment"
    "metadata" = {
      "labels" = {
        "app.kubernetes.io/component" = "controller"
        "app.kubernetes.io/instance" = "ingress-nginx"
        "app.kubernetes.io/managed-by" = "Helm"
        "app.kubernetes.io/name" = "ingress-nginx"
        "app.kubernetes.io/version" = "0.41.2"
        "helm.sh/chart" = "ingress-nginx-3.10.1"
      }
      "name" = "ingress-nginx-controller"
      "namespace" = "ingress-nginx"
    }
    "spec" = {
      "minReadySeconds" = 0
      "revisionHistoryLimit" = 10
      "selector" = {
        "matchLabels" = {
          "app.kubernetes.io/component" = "controller"
          "app.kubernetes.io/instance" = "ingress-nginx"
          "app.kubernetes.io/name" = "ingress-nginx"
        }
      }
      "template" = {
        "metadata" = {
          "labels" = {
            "app.kubernetes.io/component" = "controller"
            "app.kubernetes.io/instance" = "ingress-nginx"
            "app.kubernetes.io/name" = "ingress-nginx"
          }
        }
        "spec" = {
          "containers" = [
            {
              "args" = [
                "/nginx-ingress-controller",
                "--publish-service=$(POD_NAMESPACE)/ingress-nginx-controller",
                "--election-id=ingress-controller-leader",
                "--ingress-class=nginx",
                "--configmap=$(POD_NAMESPACE)/ingress-nginx-controller",
                "--validating-webhook=:8443",
                "--validating-webhook-certificate=/usr/local/certificates/cert",
                "--validating-webhook-key=/usr/local/certificates/key",
              ]
              "env" = [
                {
                  "name" = "POD_NAME"
                  "valueFrom" = {
                    "fieldRef" = {
                      "fieldPath" = "metadata.name"
                    }
                  }
                },
                {
                  "name" = "POD_NAMESPACE"
                  "valueFrom" = {
                    "fieldRef" = {
                      "fieldPath" = "metadata.namespace"
                    }
                  }
                },
                {
                  "name" = "LD_PRELOAD"
                  "value" = "/usr/local/lib/libmimalloc.so"
                },
              ]
              "image" = "k8s.gcr.io/ingress-nginx/controller:v0.41.2@sha256:1f4f402b9c14f3ae92b11ada1dfe9893a88f0faeb0b2f4b903e2c67a0c3bf0de"
              "imagePullPolicy" = "IfNotPresent"
              "lifecycle" = {
                "preStop" = {
                  "exec" = {
                    "command" = [
                      "/wait-shutdown",
                    ]
                  }
                }
              }
              "livenessProbe" = {
                "failureThreshold" = 5
                "httpGet" = {
                  "path" = "/healthz"
                  "port" = 10254
                  "scheme" = "HTTP"
                }
                "initialDelaySeconds" = 10
                "periodSeconds" = 10
                "successThreshold" = 1
                "timeoutSeconds" = 1
              }
              "name" = "controller"
              "ports" = [
                {
                  "containerPort" = 80
                  "name" = "http"
                  "protocol" = "TCP"
                },
                {
                  "containerPort" = 443
                  "name" = "https"
                  "protocol" = "TCP"
                },
                {
                  "containerPort" = 8443
                  "name" = "webhook"
                  "protocol" = "TCP"
                },
              ]
              "readinessProbe" = {
                "failureThreshold" = 3
                "httpGet" = {
                  "path" = "/healthz"
                  "port" = 10254
                  "scheme" = "HTTP"
                }
                "initialDelaySeconds" = 10
                "periodSeconds" = 10
                "successThreshold" = 1
                "timeoutSeconds" = 1
              }
              "resources" = {
                "requests" = {
                  "cpu" = "100m"
                  "memory" = "90Mi"
                }
              }
              "securityContext" = {
                "allowPrivilegeEscalation" = true
                "capabilities" = {
                  "add" = [
                    "NET_BIND_SERVICE",
                  ]
                  "drop" = [
                    "ALL",
                  ]
                }
                "runAsUser" = 101
              }
              "volumeMounts" = [
                {
                  "mountPath" = "/usr/local/certificates/"
                  "name" = "webhook-cert"
                  "readOnly" = true
                },
              ]
            },
          ]
          "dnsPolicy" = "ClusterFirst"
          "nodeSelector" = {
            "kubernetes.io/os" = "linux"
          }
          "serviceAccountName" = "ingress-nginx"
          "terminationGracePeriodSeconds" = 300
          "volumes" = [
            {
              "name" = "webhook-cert"
              "secret" = {
                "secretName" = "ingress-nginx-admission"
              }
            },
          ]
        }
      }
    }
  }
}

resource "kubernetes_manifest" "validatingwebhookconfiguration_ingress_nginx_admission" {
  manifest = {
    "apiVersion" = "admissionregistration.k8s.io/v1"
    "kind" = "ValidatingWebhookConfiguration"
    "metadata" = {
      "labels" = {
        "app.kubernetes.io/component" = "admission-webhook"
        "app.kubernetes.io/instance" = "ingress-nginx"
        "app.kubernetes.io/managed-by" = "Helm"
        "app.kubernetes.io/name" = "ingress-nginx"
        "app.kubernetes.io/version" = "0.41.2"
        "helm.sh/chart" = "ingress-nginx-3.10.1"
      }
      "name" = "ingress-nginx-admission"
    }
    "webhooks" = [
      {
        "admissionReviewVersions" = [
          "v1",
          "v1beta1",
        ]
        "clientConfig" = {
          "service" = {
            "name" = "ingress-nginx-controller-admission"
            "namespace" = "ingress-nginx"
            "path" = "/networking/v1beta1/ingresses"
          }
        }
        "failurePolicy" = "Fail"
        "matchPolicy" = "Equivalent"
        "name" = "validate.nginx.ingress.kubernetes.io"
        "rules" = [
          {
            "apiGroups" = [
              "networking.k8s.io",
            ]
            "apiVersions" = [
              "v1beta1",
            ]
            "operations" = [
              "CREATE",
              "UPDATE",
            ]
            "resources" = [
              "ingresses",
            ]
          },
        ]
        "sideEffects" = "None"
      },
    ]
  }
}

resource "kubernetes_manifest" "serviceaccount_ingress_nginx_ingress_nginx_admission" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "ServiceAccount"
    "metadata" = {
      "annotations" = {
        "helm.sh/hook" = "pre-install,pre-upgrade,post-install,post-upgrade"
        "helm.sh/hook-delete-policy" = "before-hook-creation,hook-succeeded"
      }
      "labels" = {
        "app.kubernetes.io/component" = "admission-webhook"
        "app.kubernetes.io/instance" = "ingress-nginx"
        "app.kubernetes.io/managed-by" = "Helm"
        "app.kubernetes.io/name" = "ingress-nginx"
        "app.kubernetes.io/version" = "0.41.2"
        "helm.sh/chart" = "ingress-nginx-3.10.1"
      }
      "name" = "ingress-nginx-admission"
      "namespace" = "ingress-nginx"
    }
  }
}

resource "kubernetes_manifest" "clusterrole_ingress_nginx_admission" {
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind" = "ClusterRole"
    "metadata" = {
      "annotations" = {
        "helm.sh/hook" = "pre-install,pre-upgrade,post-install,post-upgrade"
        "helm.sh/hook-delete-policy" = "before-hook-creation,hook-succeeded"
      }
      "labels" = {
        "app.kubernetes.io/component" = "admission-webhook"
        "app.kubernetes.io/instance" = "ingress-nginx"
        "app.kubernetes.io/managed-by" = "Helm"
        "app.kubernetes.io/name" = "ingress-nginx"
        "app.kubernetes.io/version" = "0.41.2"
        "helm.sh/chart" = "ingress-nginx-3.10.1"
      }
      "name" = "ingress-nginx-admission"
    }
    "rules" = [
      {
        "apiGroups" = [
          "admissionregistration.k8s.io",
        ]
        "resources" = [
          "validatingwebhookconfigurations",
        ]
        "verbs" = [
          "get",
          "update",
        ]
      },
    ]
  }
}

resource "kubernetes_manifest" "clusterrolebinding_ingress_nginx_admission" {
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind" = "ClusterRoleBinding"
    "metadata" = {
      "annotations" = {
        "helm.sh/hook" = "pre-install,pre-upgrade,post-install,post-upgrade"
        "helm.sh/hook-delete-policy" = "before-hook-creation,hook-succeeded"
      }
      "labels" = {
        "app.kubernetes.io/component" = "admission-webhook"
        "app.kubernetes.io/instance" = "ingress-nginx"
        "app.kubernetes.io/managed-by" = "Helm"
        "app.kubernetes.io/name" = "ingress-nginx"
        "app.kubernetes.io/version" = "0.41.2"
        "helm.sh/chart" = "ingress-nginx-3.10.1"
      }
      "name" = "ingress-nginx-admission"
    }
    "roleRef" = {
      "apiGroup" = "rbac.authorization.k8s.io"
      "kind" = "ClusterRole"
      "name" = "ingress-nginx-admission"
    }
    "subjects" = [
      {
        "kind" = "ServiceAccount"
        "name" = "ingress-nginx-admission"
        "namespace" = "ingress-nginx"
      },
    ]
  }
}

resource "kubernetes_manifest" "role_ingress_nginx_ingress_nginx_admission" {
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind" = "Role"
    "metadata" = {
      "annotations" = {
        "helm.sh/hook" = "pre-install,pre-upgrade,post-install,post-upgrade"
        "helm.sh/hook-delete-policy" = "before-hook-creation,hook-succeeded"
      }
      "labels" = {
        "app.kubernetes.io/component" = "admission-webhook"
        "app.kubernetes.io/instance" = "ingress-nginx"
        "app.kubernetes.io/managed-by" = "Helm"
        "app.kubernetes.io/name" = "ingress-nginx"
        "app.kubernetes.io/version" = "0.41.2"
        "helm.sh/chart" = "ingress-nginx-3.10.1"
      }
      "name" = "ingress-nginx-admission"
      "namespace" = "ingress-nginx"
    }
    "rules" = [
      {
        "apiGroups" = [
          "",
        ]
        "resources" = [
          "secrets",
        ]
        "verbs" = [
          "get",
          "create",
        ]
      },
    ]
  }
}

resource "kubernetes_manifest" "rolebinding_ingress_nginx_ingress_nginx_admission" {
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind" = "RoleBinding"
    "metadata" = {
      "annotations" = {
        "helm.sh/hook" = "pre-install,pre-upgrade,post-install,post-upgrade"
        "helm.sh/hook-delete-policy" = "before-hook-creation,hook-succeeded"
      }
      "labels" = {
        "app.kubernetes.io/component" = "admission-webhook"
        "app.kubernetes.io/instance" = "ingress-nginx"
        "app.kubernetes.io/managed-by" = "Helm"
        "app.kubernetes.io/name" = "ingress-nginx"
        "app.kubernetes.io/version" = "0.41.2"
        "helm.sh/chart" = "ingress-nginx-3.10.1"
      }
      "name" = "ingress-nginx-admission"
      "namespace" = "ingress-nginx"
    }
    "roleRef" = {
      "apiGroup" = "rbac.authorization.k8s.io"
      "kind" = "Role"
      "name" = "ingress-nginx-admission"
    }
    "subjects" = [
      {
        "kind" = "ServiceAccount"
        "name" = "ingress-nginx-admission"
        "namespace" = "ingress-nginx"
      },
    ]
  }
}

resource "kubernetes_manifest" "job_ingress_nginx_ingress_nginx_admission_create" {
  manifest = {
    "apiVersion" = "batch/v1"
    "kind" = "Job"
    "metadata" = {
      "annotations" = {
        "helm.sh/hook" = "pre-install,pre-upgrade"
        "helm.sh/hook-delete-policy" = "before-hook-creation,hook-succeeded"
      }
      "labels" = {
        "app.kubernetes.io/component" = "admission-webhook"
        "app.kubernetes.io/instance" = "ingress-nginx"
        "app.kubernetes.io/managed-by" = "Helm"
        "app.kubernetes.io/name" = "ingress-nginx"
        "app.kubernetes.io/version" = "0.41.2"
        "helm.sh/chart" = "ingress-nginx-3.10.1"
      }
      "name" = "ingress-nginx-admission-create"
      "namespace" = "ingress-nginx"
    }
    "spec" = {
      "template" = {
        "metadata" = {
          "labels" = {
            "app.kubernetes.io/component" = "admission-webhook"
            "app.kubernetes.io/instance" = "ingress-nginx"
            "app.kubernetes.io/managed-by" = "Helm"
            "app.kubernetes.io/name" = "ingress-nginx"
            "app.kubernetes.io/version" = "0.41.2"
            "helm.sh/chart" = "ingress-nginx-3.10.1"
          }
          "name" = "ingress-nginx-admission-create"
        }
        "spec" = {
          "containers" = [
            {
              "args" = [
                "create",
                "--host=ingress-nginx-controller-admission,ingress-nginx-controller-admission.$(POD_NAMESPACE).svc",
                "--namespace=$(POD_NAMESPACE)",
                "--secret-name=ingress-nginx-admission",
              ]
              "env" = [
                {
                  "name" = "POD_NAMESPACE"
                  "valueFrom" = {
                    "fieldRef" = {
                      "fieldPath" = "metadata.namespace"
                    }
                  }
                },
              ]
              "image" = "docker.io/jettech/kube-webhook-certgen:v1.5.0"
              "imagePullPolicy" = "IfNotPresent"
              "name" = "create"
            },
          ]
          "restartPolicy" = "OnFailure"
          "securityContext" = {
            "runAsNonRoot" = true
            "runAsUser" = 2000
          }
          "serviceAccountName" = "ingress-nginx-admission"
        }
      }
    }
  }
}

resource "kubernetes_manifest" "job_ingress_nginx_ingress_nginx_admission_patch" {
  manifest = {
    "apiVersion" = "batch/v1"
    "kind" = "Job"
    "metadata" = {
      "annotations" = {
        "helm.sh/hook" = "post-install,post-upgrade"
        "helm.sh/hook-delete-policy" = "before-hook-creation,hook-succeeded"
      }
      "labels" = {
        "app.kubernetes.io/component" = "admission-webhook"
        "app.kubernetes.io/instance" = "ingress-nginx"
        "app.kubernetes.io/managed-by" = "Helm"
        "app.kubernetes.io/name" = "ingress-nginx"
        "app.kubernetes.io/version" = "0.41.2"
        "helm.sh/chart" = "ingress-nginx-3.10.1"
      }
      "name" = "ingress-nginx-admission-patch"
      "namespace" = "ingress-nginx"
    }
    "spec" = {
      "template" = {
        "metadata" = {
          "labels" = {
            "app.kubernetes.io/component" = "admission-webhook"
            "app.kubernetes.io/instance" = "ingress-nginx"
            "app.kubernetes.io/managed-by" = "Helm"
            "app.kubernetes.io/name" = "ingress-nginx"
            "app.kubernetes.io/version" = "0.41.2"
            "helm.sh/chart" = "ingress-nginx-3.10.1"
          }
          "name" = "ingress-nginx-admission-patch"
        }
        "spec" = {
          "containers" = [
            {
              "args" = [
                "patch",
                "--webhook-name=ingress-nginx-admission",
                "--namespace=$(POD_NAMESPACE)",
                "--patch-mutating=false",
                "--secret-name=ingress-nginx-admission",
                "--patch-failure-policy=Fail",
              ]
              "env" = [
                {
                  "name" = "POD_NAMESPACE"
                  "valueFrom" = {
                    "fieldRef" = {
                      "fieldPath" = "metadata.namespace"
                    }
                  }
                },
              ]
              "image" = "docker.io/jettech/kube-webhook-certgen:v1.5.0"
              "imagePullPolicy" = "IfNotPresent"
              "name" = "patch"
            },
          ]
          "restartPolicy" = "OnFailure"
          "securityContext" = {
            "runAsNonRoot" = true
            "runAsUser" = 2000
          }
          "serviceAccountName" = "ingress-nginx-admission"
        }
      }
    }
  }
}
