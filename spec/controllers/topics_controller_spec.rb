require 'rails_helper'
require 'json_web_token'

RSpec.describe TopicsController, type: :api do
  describe 'GET /topics/' do
    context 'with correct credentials' do
      before :each do
        ram = create(:account)
        @token = JsonWebToken.encode({account_id: ram.id})
      end

      it 'should return an ok json response' do
        expected_result =   {status: "ok"}.to_json
        header 'Authorization',"#{@token}"
        get '/topics/'
        expect(last_response.body).to eq(expected_result)
      end
    end
  end
end
