class Api::ConvocationsController < ApplicationController

  #authentification d'un agent sur la plateforme
  def authUser
    phone = params[:phone]
    matricule = params[:matricule]

    #verification des information recu
    @token = Agent.where(phone: phone, matricule: matricule)
    if @token.empty?
      render json: {
        status: :not_found,
        message: :agent_inconnu,
        code: "404",
      }
    else
      render json: {
        status: :found,
        message: @token,
        code: 200,
        blue_print: SecureRandom.hex(10)
      }
    end
  end

  #permet de verifier une contravention
  def verifyContravention
    code = params[:code]
    @p = Convocation.where(code: code)
    if @p.empty?
      render json: {
        status: :not_found,
        message: "Code inconnu"
      }
    else
      render json: {
        phone: @p.phone,
        status: @p.status,
        paiement: @p.updated_at
      }
    end
  end

  # GET /convocations/new
  def conv
    cni = params[:cni]
    phone = params[:phone]
    immatriculation  = params[:immatriculation]
    motif = params[:motif]
    pieceretenue = params[:pieceretenue]
    agent = params[:agent]
    status = "impaye"
    code = SecureRandom.hex(5)

    @result = Convocation.new(cni: cni, phone: phone, immatriculation: immatriculation, motif: motif, pieceretenue: pieceretenue, status: status, agent_id: agent, code: SecureRandom.hex(5))
    if @result.save
      render json: {
        status: :save,
        message: :created,
        data: @result
      }
    else
      render json: {
        status: :unprocessable_entity,
        message: @result.errors,
        data: @result
      }.to_json    
    end
  end
end
