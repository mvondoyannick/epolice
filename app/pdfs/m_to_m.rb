#define a class for mobile to mobile transfert
class MToM
  def initialize(phone)
    @mat = phone
    puts @mat
  end

  #recois la contravention provenant du receveur
  # params: arrays of objects
  def getContraventions(content = Array.new)
    @content = content
    return @content.is_a?(Array) || nil
  end

  #valide un code recu par le transmetteur
  def valideCode(code)
    @code = code
    if valideUser == true

      return
    end
  end

  #generate all user contravention
  # detail: retourne toutes les contraventions d'un agent
  def userConvocation
    response = valideUser
    if response == true
      agent = Agent.where(phone: @mat).last
      query = Convocation.where(agent_id: agent.id)
      return query
    end
  end

  #retourne les informations sur l'agent qui est encapsulé dans la SQ code
  def generateQRcode

  end

  # detail: permet de valider l'utilisateur
  def valideUser

    #on recherche cet utilisateur
    query = Agent.find_by(phone: @mat)
    if query
      return true
    else
      return false
    end
  end

  def generateCode
    response = valideUser
    if response == true
      return SecureRandom.hex(3).upcase
    end
  end
end