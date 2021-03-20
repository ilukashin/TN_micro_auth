# frozen_string_literal: true

class AuthRoutes < Application
  helpers Auth
  
  post '/' do
    result = Auth::FetchUserService.call(extracted_token['uuid'])

    if result.success?

      status 200
      json meta: { user_id: result.user.id }
    else
      status 403
    end
  end

end
