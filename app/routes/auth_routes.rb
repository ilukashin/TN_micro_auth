# frozen_string_literal: true

class AuthRoutes < Application
  namespace '/v1' do
    post do
      token_params = request.env['HTTP_AUTHORIZATION'] || ''

      result = Auth::FetchUserService.call(*token_params)

      if result.success?

        status 200
        json meta: { user_id: result.user.id }
      else
        status 403
      end
    end
  end
end
