# Teste Técnico - Laravel + Node.js

Este repositório é um teste técnico para vaga de backend da CWI utilizando **Laravel**, **Node.js**.

---

## Funcionalidades

* CRUD completo de usuários (`name`, `email`, `password`)
* Endpoint de health check: `/health`
* Integração com microsserviço externo via `/external`

## Funcionalidades adicionais

* Documentação via Swagger
* Docker Compose
* Banco de dados via Postgree
* Estrutura MVC simples

---

## Para executar o projeto

### Requisitos

* Docker e Docker Compose instalados em sua máquina

---

### Passo a passo

1. **Clone o repositório**

```bash
git clone https://github.com/GeekBoyBiel/test-cwi.git
cd test-cwi
```

2. **Crie o arquivo `.env` a partir do `.env.example`**

```bash
cp .env.example .env
```

3. **Suba os containers com Docker Compose**

```bash
docker compose up --build -d
```

4. **Execute as migrations e o seeder para popular o banco de dados**

```bash
docker exec -it cwi-php php artisan migrate --seed
```

5. **Gere a documentação via Swagger da API (já liberado CORS para realizar teste)**

```bash
docker exec -it cwi-php php artisan l5-swagger:generate
```

---

## Endpoints principais

| Método | Rota                 | Descrição                                   |
| ------ | -------------------- | ------------------------------------------- |
| GET    | `/users`             | Lista todos os usuários                     |
| GET    | `/users/{id}`        | Exibe um usuário específico                 |
| POST   | `/users`             | Cria um novo usuário                        |
| PUT    | `/users/{id}`        | Atualiza os dados de um usuário             |
| DELETE | `/users/{id}`        | Remove um usuário                           |
| GET    | `/health`            | Verifica o status da API (`{ status: ok }`) |
| GET    | `/external`          | Consulta dados do microsserviço Node.js     |
| GET    | `/api/documentation` | Acessa a documentação Swagger               |

---

## Estrutura do projeto

```
cwi-test/
├── php/                 # Código da aplicação Laravel (API principal)
│   ├── app/             # Controllers, Models, etc.
│   ├── database/        # Migrations, Seeders, Factories
│   └── ...
├── node/                # Microsserviço Node.js (Mock de API externa)
│   ├── index.js         # Servidor Express
│   └── data/            # Arquivo employees.json
├── docker-compose.yml   # Orquestração dos serviços
├── .env                 # Variáveis de ambiente
└── README.md            # Este arquivo
```

---

## Swagger

A documentação Swagger pode ser acessada em:

👉 [http://localhost:8000/api/documentation](http://localhost:8000/api/documentation)

---

## Sobre a arquitetura

* A aplicação segue uma estrutura **MVC simples e limpa** para facilitar manutenção.
* O microsserviço Node.js simula uma API externa, consumida pelo Laravel via HTTP.
* A documentação foi gerada com o **l5-swagger**, garantindo transparência de uso da API.
* Toda orquestração dos serviços é feita via **Docker Compose**.

---

## Resultado final

* [x] Laravel rodando com sucesso
* [x] Microsserviço Node acessível
* [x] Documentação gerada e testada
* [x] Integração funcional entre os serviços

---

> Projeto finalizado e pronto para testes

