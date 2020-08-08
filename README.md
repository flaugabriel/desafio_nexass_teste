# API TESTE DESAFIO NEXASS BACK-END 

Este projeto tem como finaliade a criação de uma api JSON REST para gerenciamento de estoque de loja 

### Configuração/Ferramentas 

* Rails 6.0.3
* Ruby 2.7.1
* Banco de dados postgres 
* Docker and Postgres container
* Comando abaixo, configura uma imagem e cria um container com docker configurado:

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
* O projeto pode ser iniciado local com comando rails s.
* No database.yml do projeto configura host aponta para o docker por fim usuario root e senha root.
* Postman Canary utilizado para requisições REST.
* Caso não opite por esta configuração do banco de dados, basta altera o database.yml para forma que preferi.

# Operações sobre produto


#### CADASTRA NOVO PRODUTO

* URL de envio: 
```shell
curl --location --request POST 'http://localhost:3000/api/v1/products' \
--header 'Content-Type: application/json' \
--data-raw '{"product":{"name":"Suporte para 2 monitor MDBT","price": 250.00}}'
```
* exemplo de envio via body
```json
{
  "product":
  {
    "name":"Suporte para 2 monitor MDBT",
    "price": 250.00
  }
}
```
* resposta 

```json
{
  "msg": "Produto registrado!",
  "status": "created"
}
```

#### ALTERA PRODUTO
* Parametro id=6 
* URL
```shell
 curl --location --request PUT 'http://localhost:3000/api/v1/products/6' \
--header ': ' \
--header 'Content-Type: application/json' \
--data-raw '{"product":{"name":"Suporte para 2 monitor MDBT no maximo 37 polegadas","price": 255.00}}'1
```

* json enviado via body:

```json
{
  "product":
  {
    "name":"Suporte para 2 monitor MDBT no maximo 37 polegadas",
    "price": 255.00
  }
}
```
* resposta
```json
{
  "msg": "Produto atualizado!",
  "status": "created"
}
```
#### EXCLUIR UM PRODUTO
* parametro id=6
* URL 
```shell
curl --location --request DELETE 'http://localhost:3000/api/v1/products/3'
```
* retorno 
```json
{
  "msg": "Produto removido!"
}
```
* retorno em caso de erro
```json
{
  "msg": "Produto não existe!"
}
```
#### PESQUISAR PRODUTO
* parametro id=4 
* URL 
```shell
curl --location --request GET 'http://localhost:3000/api/v1/products/4'
```
* exemplo de retorno
```json
{
  "id": 5,
  "name": "HyperX Alloy Core",
  "price": "400.0",
  "created_at": "2020-08-07T18:49:16.622Z",
  "updated_at": "2020-08-07T18:49:16.622Z"
}
```
* exemplo de erro
```json
{
  "msg": "Produto não encontrado!"
}
```
# OPERAÇÕES SOBRE LOJAS

#### CADASTRA LOJA

* URL
```shell
curl --location --request POST 'http://localhost:3000/api/v1/stores' \
--header 'Content-Type: application/json' \
--data-raw '{"store":{"name":"loja 555","street": "Algodoeiro", "neighborhood": "Eletronorte",     "city":"Porto Velho", "cep": 76808518}}'
```
* exemplo de envio via body
```json
{
  "store":
  {
    "name":"Loja1",
    "street": "Algodoeiro",
    "neighborhood": "Eletronorte",
    "city":"Porto Velho", 
    "cep": 76808518
  }
}
```
* resposta 

```json
{
  "msg": "Loja registrada!",
  "status": "created"
}
```

#### ALTERA UMA LOJA
* Parametro id=1
* URL
```shell
curl --location --request GET 'http://localhost:3000/api/v1/stores/6'
```
* json enviado via body:
```json
{
  "store":
  {
    "name":"Loja1000",
    "street": "Algodoeiro teste",
    "neighborhood": "Eletronorte teste",
    "city":"Porto Velho teste", 
    "cep": 76808518
  }
}
```
* resposta
```json
{
  "msg": "Produto atualizado!",
  "status": "created"
}
```
#### EXCLUIR UMA LOJA
* parametro id=1
* URL 
```shell
curl --location --request DELETE 'http://localhost:3000/api/v1/stores/6'
```
* retorno 
```json
{
  "msg": "Loja removida!"
}
```
* retorno em caso de erro
```json
{
  "msg": "Loja não existe!"
}
```
#### PESQUISAR LOJA
* parametro id=1
* URL 
```shell
curl --location --request GET 'http://localhost:3000/api/v1/stores/4'
```
* exemplo de retorno
```json
{
  "id": 1,
  "name": "Loja1000",
  "street": "Algodoeiro teste",
  "neighborhood": "Eletronorte teste",
  "city": "Porto Velho teste",
  "cep": 76808518,
  "created_at": "2020-08-07T19:42:50.699Z",
  "updated_at": "2020-08-08T03:12:36.935Z"
}

```
* exemplo de erro
```json
{
  "msg": "Loja não encontrada!"
}
```
# OPERAÇÕES EM ESTOQUE
#### INSERINDO ITENS AO ESTOQUE 
* requisitos via body:
  * id de um produto
  * id de uma loja 
  * quantidade
* URL
```shell
curl --location --request POST 'http://localhost:3000/api/v1/stockitems' \
--header 'Content-Type: application/json' \
--data-raw '{
  "stockitem":
  {
    "product_id": 5,
    "store_id": 5,
    "quantities": 4
  }
}'
```
* exemplo enviado
```json
{
  "stockitem":
  {
    "product_id": 5,
    "store_id": 2,
    "quantities": 25
  }
}
```
* exemplo de sucesso 
```json
{
  "msg": "Item inserido ao estoque!",
  "status": "created"
}
```
* exemplo erros caso produto não existe ou loja
```json
{
  "msg": "Product must exist and Store must exist"
}
```
#### ADICIONAR ITENS DE UM PRODUTO AO ESTOQUE
* requisitos via url
  * produto_id
* requisitos via body:
  * quantidade
* URL
```shell
curl --location --request PUT 'http://localhost:3000/api/v1/stockitems/add/5' \
--header 'Content-Type: application/json' \
--data-raw '{
  "stockitem":
  {
    "quantities": 1
  }
}'
```
* exemplo de envio

```json
{
  "stockitem":
  {
    "quantities": 1
  }
}
```

* exemplo de retorno apos atualizar o estoque
  * Lista de novas quantidades

```json
[
    {
        "id": 1,
        "quantities": 42,
        "product_id": 5,
        "store_id": 2,
        "created_at": "2020-08-08T03:50:39.040Z",
        "updated_at": "2020-08-08T05:04:05.671Z"
    },
    {
        "id": 2,
        "quantities": 34,
        "product_id": 5,
        "store_id": 4,
        "created_at": "2020-08-08T04:24:20.252Z",
        "updated_at": "2020-08-08T05:04:05.678Z"
    }
]
```
* exemplo de erro se não tiver produto
```json
{
  "msg": "Produto não existe em estoque"
}
```
#### REMOVE ITENS DE UM PRODUTO AO ESTOQUE

* requisitos via url:
  * produto_id 
* requisitos body:
  * quantidade
* URL
```shell
curl --location --request PUT 'http://localhost:3000/api/v1/stockitems/lower/5' \
--header 'Content-Type: application/json' \
--data-raw '{
  "stockitem":
  {
    "quantities": 1
  }
}'
```
* exemplo de envio

```json
{
  "stockitem":
  {
    "quantities": 1
  }
}
```


* exemplo de retorno apos atualizar o estoque
  * Lista as novas quantidades retiradas

```json
[
    {
        "id": 1,
        "quantities": 42,
        "product_id": 5,
        "store_id": 2,
        "created_at": "2020-08-08T03:50:39.040Z",
        "updated_at": "2020-08-08T05:04:05.671Z"
    },
    {
        "id": 2,
        "quantities": 34,
        "product_id": 5,
        "store_id": 4,
        "created_at": "2020-08-08T04:24:20.252Z",
        "updated_at": "2020-08-08T05:04:05.678Z"
    }
]
```
* exemplo de erro se não tiver produto
```json
{
  "msg": "Produto não existe em estoque"
}
```
* exemplo de erro se o produto tive a baixo do estoque 
  * retorno com o estoque atualizado e com os que não foram atualizado
```json
[
  {
    "id": 2,
    "quantities": 15,
    "product_id": 5,
    "store_id": 4,
    "created_at": "2020-08-08T04:24:20.252Z",
    "updated_at": "2020-08-08T06:06:44.033Z"
  },
  {
    "id": 1,
    "product_id": 5,
    "current_quantities": 0,
    "msg": "Estoque baixo!"
  }
]
```


