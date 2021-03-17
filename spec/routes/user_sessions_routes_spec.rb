RSpec.describe UserSessionRoutes, type: :routes do
  describe 'POST /v1' do
    context 'missing parameters' do
      it 'returns an error' do
        post '/v1', email: 'bob@example.com', password_digest: ''

        # TODO: this dont returns correct code
        expect(last_response.status).to eq(422)
      end
    end

    context 'invalid parameters' do
      it 'returns an error' do
        post '/v1', email: 'bob@example.com', password_digest: 'invalid'

        expect(last_response.status).to eq(401)
        expect(response_body['errors']).to include('detail' => 'Сессия не может быть создана')
      end
    end

    context 'valid parameters' do
      let(:token) { 'jwt_token' }

      before do
        create(:user, email: 'bob@example.com', password_digest: 'givemeatoken')

        allow(JWT).to receive(:encode).and_return(token)
      end

      it 'returns created status' do
        post '/v1', email: 'bob@example.com', password_digest: 'givemeatoken'

        expect(last_response.status).to eq(201)
        expect(response_body['meta']).to eq('token' => token)
      end
    end
  end
end
