class ZipCodeService
  def initialize(code)
    @code = code
  end

  def find
    @zip_code = ZipCode.find_by_code(@code)
    return @zip_code if @zip_code

    find_from_api
  end

  private

  def find_from_api
    zip_code_info = ZipCodeApiService.new(@code).find
    ZipCode.create(zip_code_info)
  end
end