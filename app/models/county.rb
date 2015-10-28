class County < OpenStruct
  def self.service
    @service ||= SchoolistService.new
  end

  def self.all
    service.counties.map { |county| County.new(county) }
  end

  def self.find(id)
    County.new(service.county(id))
  end
end