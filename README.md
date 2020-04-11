# Git-Lighttp - Web light end smarty for Git

[![Gem Version](https://badge.fury.io/rb/git-lighttp.svg)](https://badge.fury.io/rb/git-lighttp)
[![Build Status](https://travis-ci.org/hallison/git-lighttp.svg?branch=master)](https://travis-ci.org/hallison/git-lighttp)
[![Code Climate](https://codeclimate.com/github/hallison/git-lighttp/badges/gpa.svg)](https://codeclimate.com/github/hallison/git-lighttp)
[![Inline docs](http://inch-ci.org/github/hallison/git-lighttp.svg?branch=master)](http://inch-ci.org/github/hallison/git-lighttp)

## DESCRIPTION

This project was inspired in the [Grack][1] Smart-HTTP server handler (written
by [Scott Chacon][2]) but developed using [Sinatra][3] and aims replace the
original `git-http-backend` including new features.

The main goal of the **Git-Lighttp** is implement the following useful features.

- Smart-HTTP, based on _git-http-backend_.
- Authentication flexible based on database or configuration file like `htpasswd`.
- Authorization flexible based on database or configuration file like `htgroup`.
- API to get information about repository (_Treeish_).

## SINOPSIS

Install the Git-Lighttp using [Rubygems][4].

    $ gem install git-lighttp

Or checkout the project hosted on [Gitlab][5] or [Github][6].

    $ git clone https://gitlab.com/hallison/git-lighttp.git
    $ ...
    $ cd git-lighttp
    $ make install

Configure the Rackup file (`config.ru`) using the following instructions:

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

If server.authenticate is set to true, create your own htpasswd file and move it to /home/git/repositories/htpasswd


And run:

    $ rackup --port 9092 --daemonize
    $ git clone http://localhost:9092/mycode.git

You can use the `.netrc` for improve your connection. Put this:

    machine <host> login <username> password <password>

The Git-Lighttp is under development, so there are still many improvements to
be made. Please, help us to improve the project sending your feedback to
[issues][7] or sending email to [hallisonbatista@gmail.com][8].

Discuss in [Google Groups][9].

## AUTHORS

Written by Hallison Batista <hallisonbatista@gmail.com>.

## BUGS

If you find a bug, please report it at the Git-Lighttp project's
issues tracker on [Gitlab][5] or [Github][6].

## LICENSE

Git-Lighttp is Copyright (c) 2011-2016 Hallison Batista.

This is free software, and may be redistributed under the terms specified in
LICENSE.txt.

[1]: http://github.com/schacon/grack
[2]: http://github.com/schacon
[3]: http://www.sinatrarb.com
[4]: http://rubygems.org/gems/git-lighttp
[5]: http://gitlab.com/hallison/git-lighttp
[6]: http://github.com/hallison/git-lighttp
[7]: http://gitlab.com/hallison/git-lighttp/issues
[8]: mailto:hallisonbatista@gmail.com
[9]: http://groups.google.com/group/git-lighttp

