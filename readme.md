# Prueba técnica 42 #5

## Subject

Create an API REST that contains three public endpoints only accessible after being authenticated with 42 Oauth2.

## Stack
For this project i've selected a simple stack, based on ruby, using sinatra gem as a web interface and oauth2, yaml and json gems to authenticate, parse credentials and process data respectively.

## Prerequisites
* OpenSSL linked to right paths:
``` brew install openssl && brew link openssl --force. ```
 
* All necesary gems instaled:
``` bundle install ```

* A ```secret.credentials.yml``` file, formatted as follows:

```
api:
  client_id: "your_client_id"
  client_secret: "your_client_secret"

```
If you don't know how or where to get this, please generate a new pair [here](https://profile.intra.42.fr/oauth/applications).

## Usage

```
ruby main.rb
```
The default port for this API is ```4567```
## Endpoints
### Info
```http://localhost:4567/user/USER/info```

Returns info user, formated as JSON as follows:

```
{
    "Name": "Bruno",
    "Last name": "Azuara",
    "Usual full name": "Bruno Azuara",
    "Pool month": "september",
    "Pool year": "2019"
}
```
### Skills

```http://localhost:4567/user/USER/skills```

Returns skills from USER, formated as JSON as follows:

```
{
    "cursus_id 3": {
        "Adaptation & creativity from cursus id_3": 9.94,
        "Ruby from cursus id_3": 8.89,
        "Web from cursus id_3": 7.68,
        "Shell from cursus id_3": 4.42
    },
    "cursus_id 4": {},
    "cursus_id 9": {
        "Unix from cursus id_9": 8.45,
        "Algorithms & AI from cursus id_9": 4.87,
        "Rigor from cursus id_9": 4.19,
        "Adaptation & creativity from cursus id_9": 4.18
    },
    "cursus_id 21": {
        "Rigor from cursus id_21": 3.73,
        "Network & system administration from cursus id_21": 3.35,
        "Algorithms & AI from cursus id_21": 2.76,
        "Imperative programming from cursus id_21": 2.37,
        "Adaptation & creativity from cursus id_21": 2.27,
        "Group & interpersonal from cursus id_21": 2.17,
        "Graphics from cursus id_21": 2.01,
        "Web from cursus id_21": 1.6400000000000001,
        "Organization from cursus id_21": 1.5,
        "Unix from cursus id_21": 1.02
    }
}
```

### Record
```http://localhost:4567/user/USER/record```

Returns all graded projects and scores from USER, formated as JSON as follows:

```
{
    "Born2beroot": 100,
    "Inception": 100,
    "libasm": 100,
    "Exam_Rank 03": 0,
    "Shell_2": 0,
    "Ruby_03": 0,
    "Projet_Web": 110,
    "Web_05": 100,
    "Web_03": 100,
    "Web_04": 100,
    "Ruby_07": 100,
    "Ruby_06": 100,
    "Ruby_05": 100,
    "Projet_Ruby": 100,
    "Web_02": 100,
    "Ruby_04": 100,
    "Ruby_02": 100,
    "Ruby_01": 100,
    "Ruby_00": 100,
    "Shell_3": 100,
    "Web_01": 100,
    "Web_00": 100,
    "Shell_1": 100,
    "Shell_0": 100,
    "miniRT": 100,
    "Exam_Rank 02": 100,
    "ft_server": 100,
    "get_next_line": 100,
    "ft_printf": 100,
    "netwhat": 100,
    "Libft": 107,
    "C_Piscine C 08": 40,
    "C_Piscine C 07": 15,
    "C_Piscine Rush 02": 0,
    "C_Piscine C 00": 85,
    "C_Piscine C 02": 70,
    "C_Piscine C 06": 70,
    "C_Piscine BSQ": 40,
    "C_Piscine C 05": 55,
    "C_Piscine C 03": 50,
    "C_Piscine C 04": 50,
    "C_Piscine Rush 01": 0,
    "C_Piscine C 01": 100,
    "C_Piscine Shell 01": 77,
    "C_Piscine Rush 00": 0,
    "C_Piscine Shell 00": 100,
    "UNIT_Factory Harassment & Tolerance Policy": 0,
    "harassment_policy": null,
    "C_Piscine Exam 00": 64,
    "C_Piscine Exam 01": 32,
    "C_Piscine Exam 02": 42,
    "C_Piscine Final Exam": 54
}

```

## Response status

All authorized answers return a ```200 OK``` status message. If the API credentials are wrong, the status from all answers are ```401 unauthorized```

