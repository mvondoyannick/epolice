class PrintPdf < Prawn::Document
    def initialize
        super(top_margin: 70)
        #@data = data
        size
        line_items
    end

  def size
    text "Liste des contraventions", size: 30, style: :bold
  end

  def line_items
    move_down 20
    @convocation = Convocation.all
    table [ ["ID", "Item Name"],
            [1, "Foo"],
            [2, "Bar"],
            [3, "Baz"] ]
  end
  def line_item_rows
    [%w["Date", "Phone"]] + Convocation.all.map do |item|
      [item.created_at.to_i, item.phone.to_i]
    end
  end

end