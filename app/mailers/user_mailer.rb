class UserMailer < ActionMailer::Base
  default from: "czupaczupsowy@gmail.com"

  def test_mail(email_address)
  	@email = email_address
  	mail(to: email_address, subject: 'Same super rzeczy w mailu')	
  end

  def transaction_mail(email_address)
    @mail = email_address
    mail(to: email_address, subject: 'Thank you for transaction')
  end
end
