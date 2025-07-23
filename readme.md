# Teste Técnico - Laravel + Node.js

Este projeto foi desenvolvido como parte de um teste técnico para uma vaga de desenvolvedor backend pleno, com foco em Laravel, Node.js e microsserviços.

A aplicação consiste em:

- CRUD de usuários (nome, e-mail, senha)
- Endpoint `/health` para verificação de status da API
- Integração com um microsserviço externo (Node.js) através do endpoint `/external`

## Tecnologias

- Laravel 11
- Node.js + Express
- PostgreSQL
- Swagger (documentação)
- Docker (opcional/local)

## Estrutura

- `laravel-api/` — Aplicação principal (Laravel)
- `mock-service/` — Microsserviço simples em Node.js

## Como testar

1. Clone o projeto
2. Configure o `.env`
3. Rode as migrations
4. Inicie os dois serviços (Laravel e Node.js)
5. Use o Postman ou Swagger para testar os endpoints

## Endpoints principais

- `GET /users` — Lista todos os usuários
- `POST /users` — Cria um novo usuário
- `GET /users/{id}` — Detalha um usuário
- `PUT /users/{id}` — Atualiza um usuário
- `DELETE /users/{id}` — Remove um usuário
- `GET /health` — Verifica se a API está online
- `GET /external` — Busca dados do microsserviço Node.js

## Fim

✔️ Finalizado e pronto para testes
