class UserMailer < ApplicationMailer

  def welcome_email
    @user = 'mvondoyannick@gmail.com'
    @url  = 'http://pop-circulation.herokuapp.com/admin/sign_in'
    mail(to: @user, subject: 'Vous venez de supprimer une information de la plateforme')
  end
end
