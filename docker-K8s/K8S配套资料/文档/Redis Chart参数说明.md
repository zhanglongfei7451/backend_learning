| 参数                          | 描述                                             | Default                      |
| ----------------------------- | ------------------------------------------------ | ---------------------------- |
| `image`                       | Redis image                                      | `bitnami/redis:{VERSION}`    |
| `imagePullPolicy`             | Image pull policy                                | `IfNotPresent`               |
| `serviceType`                 | Kubernetes Service type                          | `ClusterIP`                  |
| `usePassword`                 | Use password                                     | `true`                       |
| `redisPassword`               | Redis password                                   | Randomly generated           |
| `args`                        | Redis command-line args                          | []                           |
| `redisExtraFlags`             | Redis additional command line flags              | []                           |
| `persistence.enabled`         | Use a PVC to persist data                        | `true`                       |
| `persistence.path`            | Path to mount the volume at, to use other images | `/bitnami`                   |
| `persistence.subPath`         | Subdirectory of the volume to mount at           | `""`                         |
| `persistence.existingClaim`   | Use an existing PVC to persist data              | `nil`                        |
| `persistence.storageClass`    | Storage class of backing PVC                     | `generic`                    |
| `persistence.accessMode`      | Use volume as ReadOnly or ReadWrite              | `ReadWriteOnce`              |
| `persistence.size`            | Size of data volume                              | `8Gi`                        |
| `resources`                   | CPU/Memory resource requests/limits              | Memory: `256Mi`, CPU: `100m` |
| `metrics.enabled`             | Start a side-car prometheus exporter             | `false`                      |
| `metrics.image`               | Exporter image                                   | `oliver006/redis_exporter`   |
| `metrics.imageTag`            | Exporter image                                   | `v0.11`                      |
| `metrics.imagePullPolicy`     | Exporter image pull policy                       | `IfNotPresent`               |
| `metrics.resources`           | Exporter resource requests/limit                 | Memory: `256Mi`, CPU: `100m` |
| `nodeSelector`                | Node labels for pod assignment                   | {}                           |
| `tolerations`                 | Toleration labels for pod assignment             | []                           |
| `networkPolicy.enabled`       | Enable NetworkPolicy                             | `false`                      |
| `networkPolicy.allowExternal` | Don’t require client label for connections       | `true`                       |
| `service.annotations`         | annotations for redis service                    | {}                           |
| `service.loadBalancerIP`      | loadBalancerIP if service type is `LoadBalancer` | ``                           |
| `securityContext.enabled`     | Enable security context                          | `true`                       |

