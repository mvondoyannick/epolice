require 'prawn'
class PrintPdf < Prawn::Document
  def initialize(data)
    @data = data
    text 'text example'
    super(top_margin: 70)
    #@code = code
    table [["Nom et prénom du contrevenant","Nature et classe de la contravention"]]
  end

  def line_items
    #move_down 20
    #table [["Nom et prénom du contrevenant","Nature et classe de la contravention"], ["Proces verbal N°","Montant de l'amande forfaitaire"], ["Date de versement","Visas"]] +
    #          @code.line_items.map do |item|
    #  [item.name, item.motif, item.code, item.code, item.created_at, item.id]
    #end
  end
end