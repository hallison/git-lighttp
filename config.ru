# config.ru
require "git/lighttp"

Git::Lighttp::HttpBackend.configure do |server|
  server.project_root = "/your/git/repo/dir/"
  server.git_path     = "/usr/bin/git"
  server.get_any_file = true
  server.upload_pack  = true
  server.receive_pack = false
  server.authenticate = false
end

run Git::Lighttp::HttpBackend
