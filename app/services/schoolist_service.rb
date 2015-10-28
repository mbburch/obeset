class SchoolistService
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new("http://localhost:3000/v1")
  end

  def schools
    # GET http://localhost:3000/v1/schools
    parse(connection.get("schools"))
  end

  def school(id)
    # GET https://localhost:3000/v1/schools/:id
    parse(connection.get("schools/#{id}"))
  end

  def create_school(data)
    # POST http://localhost:3000/v1/schools?school[id]=1?school[uid]=12123
    parse(connection.post("schools", data))
  end

  def counties
    # GET http://localhost:3000/v1/counties
    parse(connection.get("counties"))
  end

  def county(id)
    # GET https://localhost:3000/v1/counties/:id
    parse(connection.get("counties/#{id}"))
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end