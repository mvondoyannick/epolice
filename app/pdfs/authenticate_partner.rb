class AuthenticatePartner
  #extention d'activeRecord
  def initialize(login, password)
    $email = login
    $password = password
  end

  def authenticate
    query = Member.where(email: $email, password: $password).last

    if query
      return query.map do |data|
          {
              message: :succes,
              partner: data,
              blueprint: SecureRandom.hex(10),
              created_at: Date.today,
              expire_in: 5.hour.from_now
          }
        end
    else
      return false
    end
  end
end