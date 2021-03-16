class User < Sequel::Model

  def validate
    super

    validates_presense :name, message: I18n.t(:blank, scope: 'model.errors.user.name')
    validates_presense :email, message: I18n.t(:blank, scope: 'model.errors.user.email')
  end
  
end
