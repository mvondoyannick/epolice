#module permettant de chercher une decharge
module SearchDecharge
  def initialize(cni)
    @cni = cni
  end

  def search
    #permet effectivement d'effectuer la recherche de la contravention
    data = Convocation.where(cni: @cni)
  end

end