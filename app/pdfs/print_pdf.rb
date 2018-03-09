require 'prawn'
class PrintPdf < Prawn::Document
  def initialize(code)
    super()
    @code = code
    text "Contravention #{@code}"
  end
end