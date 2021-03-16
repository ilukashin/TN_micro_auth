class UserSession < Sequel::Model

  def validate
    super

    validates_presense :uuid, message: I18n.t(:blank, scope: 'model.errors.user_session.uuid')
  end
  
end
