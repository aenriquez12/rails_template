# app/services/virus_total_lookup.rb
require 'uri'
require 'net/http'
require 'json'

class VirusTotalLookup
  API_KEY = ENV['VIRUSTOTAL_API_KEY'] # Use ENV var for security
  BASE_URL = "https://www.virustotal.com/api/v3/ip_addresses/"

  def self.lookup(ip)
    url = URI("#{BASE_URL}#{ip}")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["accept"] = 'application/json'
    request["x-apikey"] = API_KEY

    response = http.request(request)
    JSON.parse(response.body)
  rescue => e
    { error: e.message }
  end
end
