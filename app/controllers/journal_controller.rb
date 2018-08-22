class JournalController < ApplicationController
  def public
    render layout: 'admin'
  end

  def private
    @journale = Alerte.all.order(created_at: :desc)
    render layout: 'admin'
  end
end
