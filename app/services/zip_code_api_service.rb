class ZipCodeApiService
  def initialize(code)
    @code = code
    @base_url = "http://cep.la"
    @options = {
      headers: {'Accept' => 'application/json'}
    }
  end

  def find
    response = HTTParty.get(url(@code), @options)
    format(response.body)
  end

  private

  def url(action)
    "#{@base_url}/#{action}"
  end

  def format(response)
    response_json = JSON.parse(response)
    raise ApiExceptions::InvalidRequest.new(404) if response_json.empty?

    {
      address: response_json["logradouro"],
      code: response_json["cep"],
      state: response_json["uf"],
      city: response_json["cidade"],
      district: response_json["bairro"]
    }
  end
end