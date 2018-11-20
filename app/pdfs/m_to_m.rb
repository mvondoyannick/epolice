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
  def is_code_valid?(code)
    @code = code
    if is_user_valid? == true

      return
    end
  end

  #generate all user contravention
  # detail: retourne toutes les contraventions d'un agent
  def getConvocation
    response = is_user_valid?
    if response == true
      agent = Agent.where(phone: @mat).last
      query = Convocation.where(agent_id: agent.id)
      return query.map do |data|
            {
                contravention_id: data.id,
                pieceretenu_id: data.pieceretenu_id,
                pieceretenu_name: data.pieceretenu.name
            }
          end
    end
  end

  #retourne les informations sur l'agent qui est encapsulé dans la SQ code
  def getQRcode

  end

  #retourne toutes les informations sur un agent
  def getAgentData
    agent = Agent.find_by(phone: @mat)
    if agent
      return agent
    end
  end



  # detail: permet de valider l'utilisateur
  def is_user_valid?

    #on recherche cet utilisateur
    query = Agent.find_by(phone: @mat)
    if query
      return true
    else
      return false
    end
  end

  def getCode
    response = is_user_valid?
    if response == true
      return SecureRandom.hex(3).upcase
    end
  end
end