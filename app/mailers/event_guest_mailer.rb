# frozen_string_literal: true

class EventGuestMailer < ApplicationMailer
  def send_invite_email
    @invite = params[:invite]
    mail(to: @invite.email, subject: 'SuperParty invite')
  end
end
