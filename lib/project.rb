class Project
  attr_reader :title, :id

  def initialize(attributes)
    @title = attributes[:title]
    # @id = attributes[:id]
  end

  def save
    result = DB.exec("INSERT INTO projects (title) VALUES ('{#{@title}}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def ==(extra_project)
    self.title().==(extra_project.title())
  end
end
