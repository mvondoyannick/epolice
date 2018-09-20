class ManageController < ApplicationController
  before_action :authenticate_admin!

  layout 'admin'
  #layout 'fylo'

  def index

  end

  def admin
    @user = Admin.order(created_at: :desc).all
  end

  def grvpc

  end

  def gestion_commissariat_grvpc

  end

  def gestion_agent_grvpc
    @user = Grvpc.order(created_at: :desc).all
  end

  def programmation_agent_grvpc
    
  end

  def assurance
    @user = Assurance.order(created_at: :desc).all
  end

  def member
    @user = Member.order(created_at: :desc).all
  end

  def metropolis
    @user = Metropoli.order(created_at: :desc).all
  end
end
