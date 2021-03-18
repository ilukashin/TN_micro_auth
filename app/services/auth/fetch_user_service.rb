# frozen_string_literal: true

module Auth
  class FetchUserService
    prepend BasicService

    param :uuid

    attr_reader :user

    def call
      return fail!(I18n.t(:forbidden, scope: 'services.auth.fetch_user_service')) if @uuid.blank? || session.nil?

      @user = session.user
    end

    private

    def session
      @session ||= UserSession.first(uuid: @uuid)
    rescue Sequel::DatabaseError
      nil
    end
  end
end
