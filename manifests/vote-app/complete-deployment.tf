resource "kubernetes_manifest" "namespace_vote_app" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "Namespace"
    "metadata" = {
      "labels" = {
        "kubernetes.io/metadata.name" = "vote-app"
      }
      "name" = "vote-app"
    }
  }
}

resource "kubernetes_manifest" "deployment_vote_app_db" {
  manifest = {
    "apiVersion" = "apps/v1"
    "kind" = "Deployment"
    "metadata" = {
      "labels" = {
        "app" = "db"
      }
      "name" = "db"
      "namespace" = "vote-app"
    }
    "spec" = {
      "replicas" = 1
      "selector" = {
        "matchLabels" = {
          "app" = "db"
        }
      }
      "template" = {
        "metadata" = {
          "labels" = {
            "app" = "db"
          }
        }
        "spec" = {
          "containers" = [
            {
              "env" = [
                {
                  "name" = "POSTGRES_USER"
                  "value" = "postgres"
                },
                {
                  "name" = "POSTGRES_PASSWORD"
                  "value" = "postgres"
                },
              ]
              "image" = "postgres:15-alpine"
              "name" = "postgres"
              "ports" = [
                {
                  "containerPort" = 5432
                  "name" = "postgres"
                },
              ]
              "volumeMounts" = [
                {
                  "mountPath" = "/var/lib/postgresql/data"
                  "name" = "db-data"
                },
              ]
            },
          ]
          "volumes" = [
            {
              "emptyDir" = {}
              "name" = "db-data"
            },
          ]
        }
      }
    }
  }
}

resource "kubernetes_manifest" "service_vote_app_db" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "Service"
    "metadata" = {
      "labels" = {
        "app" = "db"
      }
      "name" = "db"
      "namespace" = "vote-app"
    }
    "spec" = {
      "ports" = [
        {
          "name" = "db-service"
          "port" = 5432
          "targetPort" = 5432
        },
      ]
      "selector" = {
        "app" = "db"
      }
      "type" = "ClusterIP"
    }
  }
}

resource "kubernetes_manifest" "deployment_vote_app_redis" {
  manifest = {
    "apiVersion" = "apps/v1"
    "kind" = "Deployment"
    "metadata" = {
      "labels" = {
        "app" = "redis"
      }
      "name" = "redis"
      "namespace" = "vote-app"
    }
    "spec" = {
      "replicas" = 1
      "selector" = {
        "matchLabels" = {
          "app" = "redis"
        }
      }
      "template" = {
        "metadata" = {
          "labels" = {
            "app" = "redis"
          }
        }
        "spec" = {
          "containers" = [
            {
              "image" = "redis:alpine"
              "name" = "redis"
              "ports" = [
                {
                  "containerPort" = 6379
                  "name" = "redis"
                },
              ]
              "volumeMounts" = [
                {
                  "mountPath" = "/data"
                  "name" = "redis-data"
                },
              ]
            },
          ]
          "volumes" = [
            {
              "emptyDir" = {}
              "name" = "redis-data"
            },
          ]
        }
      }
    }
  }
}

resource "kubernetes_manifest" "service_vote_app_redis" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "Service"
    "metadata" = {
      "labels" = {
        "app" = "redis"
      }
      "name" = "redis"
      "namespace" = "vote-app"
    }
    "spec" = {
      "ports" = [
        {
          "name" = "redis-service"
          "port" = 6379
          "targetPort" = 6379
        },
      ]
      "selector" = {
        "app" = "redis"
      }
      "type" = "ClusterIP"
    }
  }
}

resource "kubernetes_manifest" "deployment_vote_app_result" {
  manifest = {
    "apiVersion" = "apps/v1"
    "kind" = "Deployment"
    "metadata" = {
      "labels" = {
        "app" = "result"
      }
      "name" = "result"
      "namespace" = "vote-app"
    }
    "spec" = {
      "replicas" = 1
      "selector" = {
        "matchLabels" = {
          "app" = "result"
        }
      }
      "template" = {
        "metadata" = {
          "labels" = {
            "app" = "result"
          }
        }
        "spec" = {
          "containers" = [
            {
              "image" = "dockersamples/examplevotingapp_result"
              "name" = "result"
              "ports" = [
                {
                  "containerPort" = 80
                  "name" = "result"
                },
              ]
            },
          ]
        }
      }
    }
  }
}

resource "kubernetes_manifest" "service_vote_app_result" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "Service"
    "metadata" = {
      "labels" = {
        "app" = "result"
      }
      "name" = "result"
      "namespace" = "vote-app"
    }
    "spec" = {
      "ports" = [
        {
          "name" = "result-service"
          "nodePort" = 31001
          "port" = 5001
          "targetPort" = 80
        },
      ]
      "selector" = {
        "app" = "result"
      }
      "type" = "NodePort"
    }
  }
}

resource "kubernetes_manifest" "deployment_vote_app_vote" {
  manifest = {
    "apiVersion" = "apps/v1"
    "kind" = "Deployment"
    "metadata" = {
      "labels" = {
        "app" = "vote"
      }
      "name" = "vote"
      "namespace" = "vote-app"
    }
    "spec" = {
      "replicas" = 1
      "selector" = {
        "matchLabels" = {
          "app" = "vote"
        }
      }
      "template" = {
        "metadata" = {
          "labels" = {
            "app" = "vote"
          }
        }
        "spec" = {
          "containers" = [
            {
              "image" = "dockersamples/examplevotingapp_vote"
              "name" = "vote"
              "ports" = [
                {
                  "containerPort" = 80
                  "name" = "vote"
                },
              ]
            },
          ]
        }
      }
    }
  }
}

resource "kubernetes_manifest" "service_vote_app_vote" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "Service"
    "metadata" = {
      "labels" = {
        "app" = "vote"
      }
      "name" = "vote"
      "namespace" = "vote-app"
    }
    "spec" = {
      "ports" = [
        {
          "name" = "vote-service"
          "nodePort" = 31000
          "port" = 5000
          "targetPort" = 80
        },
      ]
      "selector" = {
        "app" = "vote"
      }
      "type" = "NodePort"
    }
  }
}

resource "kubernetes_manifest" "deployment_vote_app_worker" {
  manifest = {
    "apiVersion" = "apps/v1"
    "kind" = "Deployment"
    "metadata" = {
      "labels" = {
        "app" = "worker"
      }
      "name" = "worker"
      "namespace" = "vote-app"
    }
    "spec" = {
      "replicas" = 1
      "selector" = {
        "matchLabels" = {
          "app" = "worker"
        }
      }
      "template" = {
        "metadata" = {
          "labels" = {
            "app" = "worker"
          }
        }
        "spec" = {
          "containers" = [
            {
              "image" = "dockersamples/examplevotingapp_worker"
              "name" = "worker"
            },
          ]
        }
      }
    }
  }
}
