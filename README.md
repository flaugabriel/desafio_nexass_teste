# API TESTE DESAFIO NEXASS BACK-END 

Este projeto tem como finaliade a criação de uma api JSON REST para gerenciamento de estoque de loja 

### Configuração/Ferramentas 
* Banco de dados postgres 
* Docker and Postgres container
* Comando abaixo, baixa imagem e cria um container com docker configurado:

```
  sudo docker run -d
  --name=postgres
  -v /etc/localtime:/etc/localtime:ro
  -e POSTGRES_USER=root
  -e POSTGRES_PASSWORD=root
  -v /storage/pgdata:/var/lib/postgresql/data
  -p 5432:5432
  --restart=always
  postgres

```
* No database.yml do projeto configura host aponta para o docker por fim usuario root e senha root.
* Postman Canary utilizado para requisições REST

# Operações sobre produto

## CADASTRA NOVO PRODUTO
* Parametros enviados no formato json
* Definir o headers:
key: Content-Type
value: application/json

* URL
 POST http://localhost:3000/api/v1/products


```
  {
    "product":
    {
      "name":"Suporte para 2 monitor MDBT",
      "price": 250.00
    }
  }
```
* resposta 

```
{
    "msg": "Produto registrado!",
    "status": "created"
}
```

## ALTERA PRODUTO
* Parametro id=1
* URL
  PUT http://localhost:3000/api/v1/products/:id
* exemplo http://localhost:3000/api/v1/products/1


* json enviado via body:

```
  {
    "product":
    {
      "name":"Suporte para 2 monitor MDBT no maximo 37 polegadas",
      "price": 255.00
    }
  }
```
* resposta
```
{
    "msg": "Produto atualizado!",
    "status": "created"
}
```
## EXCLUIR UM VEICULO
* parametro id=6
* URL 
  DELETE http://localhost:3000/api/v1/products/:id
* exemplo http://localhost:3000/api/v1/products/6
* retorno 
```
{
    "msg": "Produto removido!"
}
```
* retorno em caso de erro
```
{
    "msg": "Produto não existe!"
}
```
## PESQUISAR VEICULO
* parametro id=5
* URL 
  GET http://localhost:3000/api/v1/products/:id
* exemplo http://localhost:3000/api/v1/products/6

* exemplo de retorno
```
{
    "id": 5,
    "name": "HyperX Alloy Core",
    "price": "400.0",
    "created_at": "2020-08-07T18:49:16.622Z",
    "updated_at": "2020-08-07T18:49:16.622Z"
}
```
* exemplo de erro
```
{
    "msg": "Produto não encontrado!"
}
```
# Operações sobre Lojas

## Cadastro de loja
