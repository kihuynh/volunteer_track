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

 # kinda confused how it works
 def volunteers
   volunteers = DB.exec("SELECT * FROM volunteers WHERE project_id = #{self.id()}")
   found_volunteers = []
   volunteers.each() do |volunteer|
     name = volunteer.fetch("name")
     # project_id = volunteer.fetch("product_id").to_i
     id = volunteer.fetch("id").to_i
     found_volunteers.push(Volunteer.new({:name => name, :id => id}))
   end
   found_volunteers
 end

  def ==(extra_project)
    self.title().==(extra_project.title()).&(self.id().==(extra_project.id()))
  end

  def update(attributes)
    @title = attributes[:title]
    @id = self.id()
    DB.exec("UPDATE projects SET title = '#{@title}' WHERE id = #{@id}")
  end

  def delete
   DB.exec("DELETE FROM projects WHERE id = #{self.id};")
   DB.exec("DELETE FROM volunteers WHERE project_id = #{self.id};")
  end
end
