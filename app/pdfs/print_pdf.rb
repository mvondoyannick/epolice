class PrintPdf < Prawn::Document
    def initialize(alerte)
        super(top_margin: 70)
        @alerte = alerte
        alerte_number
        line_items
    end

    def alerte_number
        text "Alerte \##{@alerte.code}", size: 20, style: :bold
    end

    def line_items
        move_down 20
        table line_item_rows do 
            row(0).font_style = :bold
            column(1..3).align = :right
            self.row_colors = ["DDDDDD", "FFFFFF"]
            self.header = true
        end
    end

    def line_item_rows
        [["Information sur l'alerte","Titre","Details","Localisation", "Carte", "Agent"]] + 
        @alerte.line_items.map do |item|
            [item.id, item.titre, item.description, item.longitude, item.latitude, item.agent.name ]
        end
    end

end