require 'net/http'
require 'httparty'
require 'json'
HTTParty::Basement.default_options.update(verify: false)
message = "bienvenue dans la salle des developpeurs"
a = HTTParty.get("https://www.agis-as.com/epolice/index.php?telephone=698500871&message=#{message}")

puts "====== #{a.inspect} ======="