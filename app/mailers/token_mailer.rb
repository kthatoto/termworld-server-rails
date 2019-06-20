class TokenMailer < ApplicationMailer

  def send_token(account)
    @token = account.token
    mail to: account.email, subject: 'Wellcome to Termworld!'
  end
end
