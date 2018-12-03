# TodoApp

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix


1 > Request (web, json, whatever)
2 > Router (módulo do phoenix)
3 > Controller < model < banco
4 > View < Template
5 > Resposta


Suprir a necessidade do usuário

problema1: usuario precisa visitar uma url
solucao: criar uma rota no router.ex

problema2: rotas precisam ser mapeadas para uma controller
solucao2: a funcao em uma controller irá resolver o problema

problema3: precisamos de um form para o usuário
solucao: criar um teplate com um form

problema4: traduzir os dados para o banco
solucao: o modelo entrega os dados para o banco

