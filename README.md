# Portfolio Dashboard
This repository is the main repository for the Portfolio Dashboard application.

## 1 How to use the application
### 1.1 Prerequisites
#### 1.1.1 Docker
This program is using Docker Compose which is part of the Docker program, to install it follow the instruction here: https://docs.docker.com/install

#### 1.1.2 Front End and Back End
Since the Front End and Back End parts of this application are located in another git repository, you need to clone them first.
To do so this repository is using git submodules, you can run the following commands to clone the repository:
```shell
git submodule init
```

```shell
git submodule update
````

#### 1.1.3 Environment Variables
The following environment variables are needed to run the application:

- `PD_BACKEND_ADDRESS`: The IP address of the backend
- `PD_HTTPS`: `true` or `false` to indicate if the protocol used is http or https
- `PD_DOMAIN`: The domain from which the application is accessible, set to `none` if there is none
- `PD_KEYCLOAK_USER`: The username for the keycloak superuser
- `PD_KEYCLOAK_PASSWORD`: The password for the keycloak superuser
- `PD_KEYCLOAK_ADDRESS`: The keycloak address
- `PD_KEYCLOAK_REALM`: The name of the keycloak realm
- `PD_KEYCLOAK_POSTGRES_USER`: The username for the keycloak database user
- `PD_KEYCLOAK_POSTGRES_PASSWORD`: The password for the keycloak database user
- `PD_KEYCLOAK_FRONTEND_CLIENT_ID`: The id of the frontend keycloak's client
- `PD_KEYCLOAK_BACKEND_CLIENT_ID`: The id of the backend keycloak's client
- `PD_API_POSTGRES_USER`: The username for the api database user
- `PD_API_POSTGRES_PASSWORD`: The password for the api database password

To add an env var you can add it to the `~/.profile` file this way:
```shell
echo "export ENV_VAR_NAME=env_var_value" >> ~/.profile
```

You can then load the `~/.profile` using this command if you do not want to restart your bash:
```shell
source ~/.profile
```

## 1.2 Run the application
### 1.2.1 Production environment
Run the following command to launch the Docker Compose containers and run the application:
```shell
make prod start
```

The application will then be available at this address: `http://localhost`.

And to stop it you just need to run the following script:
```shell
make prod stop
```

### 1.2.2 Development environment
To run the program with only the tools needed for development you can run the following commands:
```shell
# To start
make dev start
# To stop
make dev stop
```

