require 'net/http'
require 'httparty'
require 'json'
require 'active_record'
require 'active_record/associations'
require 'active_record/associations/association'
HTTParty::Basement.default_options.update(verify: false)
message = "Numero VANESTA 697 33 50 61. Ngnarkana"
a = HTTParty.get("https://www.agis-as.com/epolice/index.php?telephone=691451189&message=#{message}")
puts "======= #{a} ========"
class Sms
  def initialize(number, message)
    @number   = number
    @message  = message
  end
end