class Deployment
  include Virtus.model

  attribute :type, String
  attribute :account_id, Integer
  attribute :name, Integer

  attribute :port, Integer
  attribute :host, String

  attribute :username, String
  attribute :password, String

  def self.find(id)
    # binding.remote_pry
    response = Faraday.get("#{Rails.application.secrets.api_url}/deployments/#{id}")
    body = JSON.parse(response.body)
    if body['type']
      class_by_type(body['type']).new(body)
    else
      return nil 
    end
  end

  def self.class_by_type(type)
    "#{type.classify}::Deployment".constantize
  end

end
