class AuthenticatePartner
  #extention d'activeRecord
  def initialize(login, password)
    $email = login
    $password = password
  end

  def authenticate
    #query = Member.where(email: $email, password: $password).last
    query = Member.where(email: $email).first

    if query&.valid_password?($password)
      return query.as_json(only: [:id, :email, :phone, :structure_id, message: 'success']), status: :authenticated
    else
      return :unauthorized
    end
  end
end