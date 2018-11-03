require 'net/http'
require 'httparty'
require 'json'
require 'active_record'
require 'active_record/associations'
require 'active_record/associations/association'
HTTParty::Basement.default_options.update(verify: false)
#message = "Numero VANESTA 697 33 50 61. Ngnarkana"
message = "Mr/Mme 691451189, votre amende est de 25000. Code contraveniton : 2015. Rendez-vous sur https://goo.gl/3hm3ke."
a = HTTParty.get("https://www.agis-as.com/epolice/index.php?telephone=691451189&message=#{message}")
puts "======= #{a} ========"
class Sms
  def initialize(number, message)
    @number   = number
    @message  = message
  end
end