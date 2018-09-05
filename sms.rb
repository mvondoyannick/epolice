require 'net/http'
require 'httparty'
require 'json'
require 'active_record'
require 'active_record/associations'
require 'active_record/associations/association'
HTTParty::Basement.default_options.update(verify: false)
message = "bienvenue dans la salle des developpeurs"
a = HTTParty.get("https://www.agis-as.com/epolice/index.php?telephone=698500871&message=bonsoir")
#698414908