require 'net/http'
require 'httparty'
require 'json'
require 'active_record'
require 'active_record/associations'
require 'active_record/associations/association'
HTTParty::Basement.default_options.update(verify: false)
message = "bienvenue dans la salle des developpeurs"
#a = HTTParty.get("https://www.agis-as.com/epolice/index.php?telephone=698500871&message=#{message}")

#puts "====== #{a.inspect} ======="

@conv = Convocation.all
 @conv.each do |f|
  if f.infraction_id.nil?
    f.infraction_id = rand(5)
  end
   if f.pieceretenue.nil?
     f.pieceretenue_id = rand(3)
   end
 end