# frozen_string_literal: true

module Users
  class CreateService
    prepend BasicService

    param :name
    param :email
    param :password

    attr_reader :user

    def call
      @user = User.new(
        name: @name,
        email: @email,
        password_digest: @password
      )

      if @user.valid?
        @user.save
      else
        fail!(@user.errors)
      end
    end
  end
end
