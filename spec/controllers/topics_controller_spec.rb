require 'rails_helper'
require 'json_web_token'

RSpec.describe TopicsController, type: :api do
  describe 'GET /topics/' do
    context 'with correct credentials' do
      it 'returns topics' do
        ram = create(:account)
        auth_header_set(ram)
        create(:topic, account_id: ram.id)
        create(:topic, account_id: ram.id)
        create(:topic, account_id: ram.id)

        get '/topics/'

        expect(json).not_to be_empty
        expect(json.size).to eq(3)
      end
    end
  end
end
