class UserSessionRoutes < Application
  namespace '/v1' do
    
    post do
      session_params = validate_with(UserSessionParamsContract)

      result = UserSessions::CreateService.call(*session_params.to_h.values)

      if result.success?
        token = JwtEncoder.encode(uuid: result.session.uuid)
        meta = { token: token }

        status 201
        json meta: meta
      else
        status 401
        error_response(result.session || result.errors)
      end
    end
  end
end