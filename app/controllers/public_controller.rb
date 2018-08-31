class PublicController < ApplicationController
  def index
  end

  def search
  end

  def result
  end

  def abonne
  end

  def desabonne
  end

  def attempt_search
    #permet de faire la recherche
    content = params[:content]
    if params[:content].present?
      case params[:type]
      when "cni"
        @search = Convocation.where(cni: content, status: "impaye").last(5)
      when "telephone"
        @search = Convocation.where(phone: content, status: "impaye").last(5)
      when "code"
        @search = Convocation.where(code: content, status: "impaye").last(5)
      end
      puts "=== #{search} === "
    else
      puts "on ne vois rien"
    end
  end
end
