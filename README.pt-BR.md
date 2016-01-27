# Git-Lighttp - Web mais leve e esperta para o Git

[![Gem Version](https://badge.fury.io/rb/git-lighttp.svg)](https://badge.fury.io/rb/git-lighttp)
[![Build Status](https://travis-ci.org/hallison/git-lighttp.svg?branch=master)](https://travis-ci.org/hallison/git-lighttp)

## DESCRIÇÃO

Este projeto foi inspirado no [Grack][1], um servidor de processos Smart-HTTP
(escrito por [Scott Chacon][2], mas projetado usando [Sinatra][3] e visa
substituir o `git-http-backend` original incluindo novas funcionalidades.

[1]: http://github.com/schacon/grack
[2]: http://github.com/schacon
[3]: http://www.sinatrarb.com

O objetivo principal do **Git-Lighttp** é implementar as seguintes
funcionalidades:

- Smart-HTTP, baseado no _git-http-backend_.
- Autenticação flexível baseado em banco de dados ou arquivo de configuração
  como `htpasswd`.
- Autorização básica baseado em banco de dados ou arquivo de configuração
  como o `htgroup`.
- API para obter informações sobre o repositório (_Treeish_).

## SINOPSE

Instale o Git-Lighttp usando [Rubygems][1].

[1]: http://rubygems.org/gems/git-lighttp

    $ gem install git-lighttp

Ou faça um _checkout_ do projeto hospedado no [Gitlab][1] ou no [Github][2].

[1]: http://gitlab.com/hallison/git-lighttp
[2]: http://github.com/hallison/git-lighttp

    $ git clone https://gitlab.com/hallison/git-lighttp.git
    ...
    $ cd git-lighttp
    $ make install

Configure o arquivo Rackup (+config.ru+) usando as seguintes instruções:

    # config.ru
    require "git/lighttp"

    Git::Lighttp::HttpBackend.configure do |server|
      server.project_root = "/home/git/repositories"
      server.git_path     = "/usr/bin/git"
      server.get_any_file = true
      server.upload_pack  = true
      server.receive_pack = false
      server.authenticate = true
    end

    run Git::Lighttp::HttpBackend

    $ rackup --port 9092 --daemonize
    $ git clone http://localhost:9092/mycode.git

Você poderá usar o arquivo `.netrc` para melhorar sua conexão. Coloque
isso:

    machine <servidor> login <usuario> password <senha>

O Git-Lighttp está em desenvolvimento, então ainda há muitas melhorias a serem
feitas. Por favor, nos ajude a melhorar o projeto enviando seu comentário nos
[problemas][1] encontrados ou enviando um email para
[hallisonbatista@gmail.com][2].

[1]: http://github.com/hallison/git-lighttp/issues
[2]: mailto:hallisonbatista@gmail.com

Discuta no [Google Groups][1].

[1]: http://groups.google.com/group/git-lighttp

## AUTORES

Escrito por Hallison Batista <hallisonbatista@gmail.com>.

## ERROS

Se você encontrar um erro, por favor, informe no
[gerenciador de erros][1] do projeto
Git-Lighttp no Github.

[1]: http://github.com/hallison/git-lighttp

## LICENÇA

Git-Lighttp é Copyright (c) 2011-2015 Hallison Batista.

Este é um _software_ livre e pode ser redistribuído sob os termos
especificados em LICENSE.txt.

