<h1 align="center"> FeirApp </h1>

<p align="center">
  <img src="https://user-images.githubusercontent.com/71350546/208153154-d0ce76a2-6ce4-4d17-a1e8-41529bddf79c.png"/>
</p>

<p align="center">
  <img src="http://img.shields.io/static/v1?label=STATUS&message=FINALIZADO&color=GREEN&style=for-the-badge"/>
  <img src="https://img.shields.io/static/v1?label=DESENVOLVIDO%20PARA&message=TCC&color=blueviolet&style=for-the-badge"/>
  <img src="https://img.shields.io/static/v1?label=FLUTTER&message=MOBILE&color=informational&style=for-the-badge"/>
  <img src="https://img.shields.io/static/v1?label=FLUTTER%20VERSION&message=3.0.5&color=blue&style=for-the-badge"/>
</p>

# Índice 

* [Índice](#índice)
* [Sobre o Projeto](#sobre-o-projeto)
* [Funcionalidades do projeto](#funcionalidades-do-projeto)
* [Demonstração da Aplicação](#demonstração-da-aplicação)
* [Principais Bibliotecas Utilizadas](#principais-bibliotecas-utilizadas)
* [Conclusão](#conclusão)
* [Autores](#autores)

## Sobre o projeto

<p text-align: justify; word-wrap: break-word;>
  Aplicativo <b>FeirApp</b> foi desenvolvido como projeto de TCC dos alunos concluintes do curso de Ciências da Computação da UNIFENAS no ano de 2022.
  </br>
  </br>
  O aplicativo surgiu com a idealização de ser um meio de vender produtos advindos da agricultura familiar, que sofrem com a grande concorrência perante empresas maiores, além de que este cenário se intensificou com o advendo da pandemia da COVID-19.
  </br>
  </br>
  O projeto é um aplicativo híbrido delivery, que faz a exibição e comercialização dos produtos dos agricultores. 
  O software possui cadastro de novos usuários, simulação de compras (como carrinho, detalhes dos produtos e finalização de compras). 
  Foi idealizado para que possa realizar pagamentos pelo próprio aplicativo, porém foi um módulo que não foi concluído até o momento pelos alunos, que estão agora formados.
  </br> 
  </br>
  O aplicativo faz uso da FeirApp API que foi desenvolvida para intermediar a Dashboard com o app, com isso todos os dados que são inseridos no aplicativo já estão conectados com toda a lógica processual desenvolvida na API, como o banco de dados.
</p>
<p>
  Desenvolvido em Flutter na sua versão 3.0.5.
</p>

## Funcionalidades do projeto

:heavy_check_mark: Exibir produtos em vitrine e seus devidos detalhes.

:heavy_check_mark: Realizar o cadastro e edição de usuário.

:heavy_check_mark: Adicionar e retirar produtos do carrinho de compras

:heavy_check_mark: Simular compra e venda de produtos, obtendo endereço de entrega/cobrança e a forma de pagamento do pedido.

:heavy_check_mark: Demonstrar vitrine de propriedades e quais produtos estão vinculados com o mesmo.

:heavy_check_mark: Após usuário logado, mostrar os pedidos em aberto e os já concluídos.

:heavy_check_mark: Demonstrar perfil do usuário que fez o login.

## Demonstração da Aplicação

<h3 align="center"> Visão Geral do APP 👇 </h3>
<p align="center">
  <img src="https://user-images.githubusercontent.com/71350546/208196153-0d4f5235-0fe5-4138-bd95-262bd3c2c144.gif"/>
</p>

<p text-align: justify;> 
  Logo quando um usuário, estando logado ou não, entra no aplicativo já tem acesso à vitrine de produtos juntamente aos que estão em promoção, podendo filtrar por algum tipo em específico ou pesquisar o produto que preferir.
</p>

<h3 align="center"> Tela de Detalhes do Produto 👇 </h3>
<p align="center">
  <img src="https://user-images.githubusercontent.com/71350546/208196537-3bb307d9-4530-4b64-8282-b09f51b02e24.gif"/>
</p>
<p text-align: justify;> 
  Os detalhes do produto demonstram a quantidade de produtos que existem no estoque, além de proporcionar que o usuário adicione a quantidade que quiser em seu carrinho.
</p>

<h3 align="center"> Tela de pedidos após logar juntamente com o carrinho 👇 </h3>
<p align="center">
  <img src="https://user-images.githubusercontent.com/71350546/208196694-4b074aff-8422-4fc5-b742-080d346ca9ff.gif"/>
</p>
<p text-align: justify;> 
  Após o usuário fazer seu cadastro e seu login, o mesmo poderá fazer um pedido, que ficará na aba "Pedidos", também poderá adicionar e visualizar seus produtos do carrinho de compras.
</p>

<h3 align="center"> Realizando um Pedido (FAKE) 👇 </h3>
<p align="center">
  <img src="https://user-images.githubusercontent.com/71350546/208197048-5a477882-5e35-4ad8-9f39-48e913e11951.gif"/>
</p>
<p text-align: justify;> 
  A ideia principal é da utilização dos meios de pagamento atuais como o Cartão, Pix, PayPal, entre outros.
</p>

## Principais Bibliotecas Utilizadas

<p>
📘 - get 4.6.5 - Utilizado para praticamente tudo do projeto - Disponível em: https://pub.dev/packages/get </br>

📖 - Bibliotecas que já vem junto com o framework Flutter, além de mais algumas que ajudam na exibição de dados na tela, como pode ser visto abaixo:

```
dependencies:
  flutter:
    sdk: flutter
  get: ^4.6.5
  unicons: ^2.1.0
  flip_card: ^0.6.0
  cupertino_icons: ^1.0.2
  carousel_slider: ^4.1.1
  flutter_secure_storage: ^6.0.0
  smooth_page_indicator: ^1.0.0+2
  flutter_spinkit: ^5.1.0
  intl: ^0.17.0
```
</p>

## Conclusão

<p>
  O software deste repositório, dispõe de uma premissa excelente, já que o mesmo além de facilitar a vida do produtor, que poderá exibir seus produtos antes mesmo de colocar nas feiras urbanas, facilitará também o cliente que gosta de produtos da feira, mas não tem disponibilidade de tempo para ir até a mesma. </br>
  Porém um fato impportante é que o app necessita de melhorias em alguns pontos, com o foco especialmente no desenvolvimento do módulo de pagamento, que é bem mais complexo e envolveria outros microsserviços.
</p>

# Autores

| [<img src="https://avatars.githubusercontent.com/u/71350546?v=4" width=115><br><sub>Matheus Fidelis</sub>](https://github.com/FidelisMatheus) | [<img src="https://avatars.githubusercontent.com/u/71300827?v=4" width=115><br><sub>Matheus Fidelis</sub>](https://github.com/FidelisMatheus) |  [<img src="https://avatars.githubusercontent.com/u/71300702?v=4" width=115><br><sub>Matheus Fidelis</sub>](https://github.com/FidelisMatheus) |
| :---: | :---: | :---: 

<p align="center">
Copyright :copyright: 2022 - Dashboard FeirApp
</p>
