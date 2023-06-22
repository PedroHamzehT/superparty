# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def magic_link_email
    user = params[:user]
    @magic_link = "http://localhost:3000/sessions/magic_link?auth_token=#{user.auth_token}"
    mail(to: user.email, subject: 'Log in Superparty with your magic link')
  end
end
