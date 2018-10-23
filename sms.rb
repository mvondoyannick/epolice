require 'net/http'
require 'httparty'
require 'json'
require 'active_record'
require 'active_record/associations'
require 'active_record/associations/association'
HTTParty::Basement.default_options.update(verify: false)
message = "Mr/Mme NKOLO Anatole, vous avez ete ajoute sur la plateforme E-POLICE vos identifiants sont matricule : agis, phone: 697970210."
a = HTTParty.get("https://www.agis-as.com/epolice/index.php?telephone=697970210&message=#{message}")
puts "======= #{a} ========"
class Sms
  def initialize(number, message)
    @number   = number
    @message  = message
  end
end