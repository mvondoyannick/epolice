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
class SprintPayGateway

  #défintion des entetes


  #permet de verifier s'il s'agit de MTN ou d'ORANGE
  def verify

  end

  #permet d'effectuer le paiement proprement dit
  def pay
    #definitin de l'url de base
    base_payment_url = 'https://www.abc.com/api/paiement/'
    #definition des headers

    headers: {
        'Postman-Token': '9669f6e7-402b-4dc9-a370-472194583c32',
        'cache-control': 'no-cache',
        'Authorization': 'SP:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
        'DateTime': 'YYYYYYYYYYYYYYYYYYYY',
        'Content-Type': 'application/json'
    }

    #defintion du bodies/main content
    setBody: {
        "amount": 1,
        "currency": "EUR",
        "firstName": "AMADOU",
        "lastName": "BAKARI",
        "address1": "Yaounde",
        "address2": "Nkolfoulou",
        "city": "Yaounde",
        "state": "Centre",
        "country": "FR",
        "postal": "0332",
        "mobileNumber": "237690000999",
        "emailId": "amadoubakari@gmail.com",
        "spMerchandUrl": "http://sprint-pay.com/"
    }

    #envoi du paiement
    response = httparty.post(
        base_payment_url,
        body: setBody,
        headers: headers
    )

    puts response

  end
end