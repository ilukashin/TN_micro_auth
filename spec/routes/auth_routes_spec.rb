# frozen_string_literal: true

RSpec.describe AuthRoutes, type: :routes do
  describe 'POST /' do
    context 'valid token' do
      let(:user) { create(:user) }
      let(:session) { create(:user_session, user: user) }

      it 'returns corresponding user' do
        header 'Authorization', session.uuid
        post '/v1'

        expect(last_response.status).to eq(200)
        expect(response_body['meta']).to eq('user_id' => user.id)
      end
    end

    context 'invalid auth token' do
      it 'returns an error' do
        header 'Authorization', 'invalid'
        post '/v1'

        expect(last_response.status).to eq(403)
      end
    end

    context 'missing auth token' do
      it 'returns an error' do
        post '/v1'

        expect(last_response.status).to eq(403)
      end
    end
  end
end
