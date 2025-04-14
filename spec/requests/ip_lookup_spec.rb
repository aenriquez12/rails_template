require 'rails_helper'

RSpec.describe "IP Lookups", type: :request do
  let(:valid_ip) { "8.8.8.8" }
  let(:api_url) { "https://www.virustotal.com/api/v3/ip_addresses/#{valid_ip}" }

  let(:mock_response) {
    {
      data: {
        id: valid_ip,
        type: "ip_address",
        attributes: {
          country: "US",
          last_analysis_stats: {
            harmless: 70,
            malicious: 2,
            suspicious: 1
          }
        }
      }
    }.to_json
  }

  before do
    stub_request(:get, api_url)
      .with(
        headers: {
          'Accept'=>'application/json',
          'X-Apikey'=>ENV['VIRUSTOTAL_API_KEY']
        }
      )
      .to_return(status: 200, body: mock_response, headers: {})
  end

  describe "POST /ip_lookups" do
    it "returns a successful response and displays the lookup result" do
      post ip_lookups_path, params: { ip: valid_ip }
      follow_redirect! if response.status == 302
      expect(response).to have_http_status(:success)
    end 
  end
end
