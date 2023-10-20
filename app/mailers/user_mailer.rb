# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def one_time_password_email
    user = params[:user]
    @one_time_password = user.one_time_password
    mail(to: user.email, subject: 'Here is your code to login SuperParty!')
  end

  def reset_password_email
    user = params[:user]
    @reset_password_link = "http://localhost:3000/api/v1/users/reset_password?token=#{user.reset_password_token}"
    mail(to: user.email, subject: 'Recover password request')
  end
end
