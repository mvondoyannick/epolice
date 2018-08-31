class CompteController < ApplicationController
  def index
    @user = Agent.all
    render layout: 'admin'
  end

  def validate
  end

  def update
  end

  def authorise
  end

  def block
  end
end
