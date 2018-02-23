class Project
  attr_reader :title, :id

  def initialize(attributes)
    @title = attributes[:title]
    @id = attributes[:id]
  end

  def self.all
    returned_projects = DB.exec("SELECT * FROM projects;")
    projects = []
    returned_projects.each() do |project|
      title = project.fetch("title")
      id = project.fetch("id").to_i
      projects.push(Project.new({:title => title, :id => id}))
    end
    projects
  end

  def save
    result = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def self.find(id)
    found_project = nil
    Project.all().each() do |project|
      if project.id().== (id)
        found_project = project
      end
    end
    found_project
  end

  def ==(extra_project)
    self.title().==(extra_project.title()).&(self.id().==(extra_project.id()))
  end



end
