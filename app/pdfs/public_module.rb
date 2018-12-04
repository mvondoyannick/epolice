class PublicModule
  #attr_reader region
  def initialize(*args) #**args represente les arguments optionnels
    $phone = args[0][:phone]
    $cni = args[0][:cni]
    $token = args[0][:token]
    $q = args[0][:query]
    $type = args[0][:type]
    #$region = args[0][:query]
    #$arrondissement = args[0][:query] #uniquement les arrondissement
    #$all = args[0][:query] #tous les arretes sur la plateforme
    $region = %w(douala yaounde garoua maroua)
  end

  def self.test
    #@phone = args[0][:phone]
    return "#{$phone} et #{$cni}"
  end

  #retourne les informations d'une contravention
  # params AUCUN
  def self.contravention
    contravention = Convocation.where(phone: $phone)
    if contravention
      return contravention.as_json(only: [:id, :phone, :immatriculation, :created_at, :agent_id, :token, :code, :infraction_id, :pieceretenu_id])
    else
      return nil
    end

  end

  #permet d'authentifier un agent de police particulier
  def self.authenticate_agent
    query = Agent.where(tokenagent: $token.downcase)
    return query.as_json(only: [:name, :prenom, :grade_id, :sexe, :region_id ])

  end

  #retourne le cout total d'une contravention
  def self.infraction_list
    infraction = Infraction.all
    return infraction.as_json(only: [:id, :motif, :montant])
  end

  #retourne tous les arretés dans le cadre des informations d'education
  # usage_1 PublicModule.new(query: 'littoral', type: 'region|departement|arrondissement')
  # usage_2 PublicModule::show_arrete
  # result JSON tree
  def self.show_arrete
    #cas de tous les arreter
    case $type
    when 'region'
      case $q
      when $q
        r = Region.where("name LIKE '%#{$q}%' ").first
        query = Infraction.where(region_id: r.id)
        return query.as_json(only: [:id, :motif, :montant, :source])
      end
    when 'departement'
      case $q
      when $q
        r = Departement.where("name LIKE '%#{$q}%' ").first
        query = Infraction.where(departement_id: r.id)
        return query.as_json(only: [:id, :motif, :montant, :source])
      end
    when 'arrondissement'
      case $q
      when $q
        r = Arrondissement.where("name LIKE '%#{$q}%' ").first
        query = Infraction.where(arrondissement_id: r.id)
        return query.as_json(only: [:id, :motif, :montant, :source])
      end
    end

  end
end