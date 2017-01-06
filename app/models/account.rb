class Account
  include Virtus.model

  attribute :id, Integer
  attribute :slug, String

  def self.find(id)
    new JSON.parse(Faraday.get("#{Rails.application.secrets.api_url}/accounts/#{id}").body)
  end
end
