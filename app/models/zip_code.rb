class ZipCode < ApplicationRecord
  def full_address
    "#{address}, #{district} - #{code} - #{city}/#{state}"
  end

  def to_json
    {
      address: address,
      district: district,
      code: code,
      city: city,
      state: state,
      full_address: self.full_address
    }
  end
end
