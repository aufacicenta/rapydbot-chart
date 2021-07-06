# rapydbot-chart

## Installation

Quick start instructions for the setup and configuration of secrets-store-csi-driver using Helm.

### Prerequisites

- [Helm v3.0+](https://helm.sh/docs/intro/quickstart/#install-helm)

### Installing the chart

```bash
$ helm repo add rapydbot https://aufacicenta.github.io/rapydbot-chart/
$ helm install my-rapydbot rapydbot/rapydbot 
```

### Configuration

The following table lists the configurable parameters of the rapydbot chart and their default values.

| Parameter                       | Description                                                                                           | Default                                          |
| ------------------------------- | ----------------------------------------------------------------------------------------------------- | ------------------------------------------------ |
| `nameOverride`                  | String to partially override rapydbot.fullname template with a string (will prepend the release name) | `""`                                             |
| `fullnameOverride`              | String to fully override rapydbot.fullname template with a string                                     | `""`                                             |
| `env`                           | Node env Variable for nodejs applications                                                             | `test`                                           |
| `secretsManager.enabled`        | Allow to containers load secrets from AWS Secrets Manager                                             | `true`                                           |
| `secretsManager.secretName`     | AWS Secreat Manager Name                                                                              | `secret-rapydbot`                                |
| `secretsManager.serviceAccount` | Service Account Name that have permissions to access to Secret Manager                                | `rapyd-secret-sa`                                |
| `mysql.user`                    | MySQL username. Used if *secretsManager.enabled* is disabled                                          | `admin`                                          |
| `mysql.password`                | MySQL password. Used if *secretsManager.enabled* is disabled                                          | `""`                                             |
| `mysql.host`                    | MySQL host. Used if *secretsManager.enabled* is disabled                                              | `db.rapydbot.local`                              |
| `mysql.port`                    | MySQL port. Used if *secretsManager.enabled* is disabled                                              | `3306`                                           |
| `rapyd.saltLength`              | Rapyd Salt Length                                                                                     | `8`                                              |
| `rapyd.baseUrl`                 | Rapyd Base URL                                                                                        | `https://sandboxapi.rapyd.net`                   |
| `rapyd.accessKey`               | Rapyd Access Key. Used if *secretsManager.enabled* is disabled                                        | `""`                                             |
| `rapyd.secretkey`               | Rapyd Secret Key. Used if *secretsManager.enabled* is disabled                                        | `""`                                             |
| `wallet.ipAddress`              | Wallet service listening interface                                                                    | `0.0.0.0`                                        |
| `wallet.port`                   | Wallet service listening port                                                                         | `8080`                                           |
| `wallet.image`                  | Wallet service container image                                                                        | `public.ecr.aws/l0y7w6p3/rapydbot/wallet:latest` |
| `wallet.db_name`                | Wallet service database name                                                                          | `WALLET`                                         |
| `user.ipAddress`                | User service listening interface                                                                      | `0.0.0.0`                                        |
| `user.port`                     | User service listening port                                                                           | `8081`                                           |
| `user.testPort`                 | User service listening testport (experimental)                                                        | `4102`                                           |
| `user.serverEndpoint`           | User service service endpoint                                                                         | `/`                                              |
| `user.image`                    | User service container image                                                                          | `public.ecr.aws/l0y7w6p3/rapydbot/user:latest`   |
| `user.db_name`                  | Wallet service database name                                                                          | `USER`                                           |
| `bot.token`                     | Telegram Bot token. Used if *secretsManager.enabled* is disabled                                      | `""`                                             |
| `bot.certArn`                   | AWS ACM ARN for Bot service. If it's set you can access the service by https                          | `""`                                             |
| `bot.image`                     | Bot service container image                                                                           | `public.ecr.aws/l0y7w6p3/rapydbot/bot:latest`    |

### Notes

- This chart does not deploy a MySQL database. **You must create a MySQL before install this chat**. You can use this [CDK template](https://github.com/aufacicenta/rapydbot-infra) to deploy the full environment in AWS, this include a MySQL Database, or use this [public chart](https://bitnami.com/stack/mysql/helm). 
