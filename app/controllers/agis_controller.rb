class AgisController < ApplicationController
  def console
    @a = ["1","2","3"]
    respond_to do |format|
      format.html
      format.json do
        render json: @a
      end
    end
  end
end
