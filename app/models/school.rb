class School < OpenStruct
  def self.service
    @service ||= SchoolistService.new
  end

  def self.all
    service.schools.map { |school| School.new(school) }
  end

  def self.find(id)
    School.new(service.school(id))
  end

  def self.create(data)
    School.new(service.create_school(data))
  end
end