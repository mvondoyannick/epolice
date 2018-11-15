# @detail: module permettant de localiser une piece d'un contrevenant
# @developer: emailto:mvondoyannick@gmail.com
# @params:
class LocalisePiece
  #require 'Active'

  def initialize(cni)
    @cni = cni
    #super
  end

  # @detail: localise la piece, sa position et la personne qui la detient actuellement
  def localise
    #Store.where(cni: @cni).last
    #Convocation.where(phone: @cni)
    puts "Bonjour #{@cni}"
  end

end