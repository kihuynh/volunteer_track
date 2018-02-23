class Volunteer
  attr_reader(:name, :project_id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @project_id = attributes.fetch(:project_id)
  end

  def ==(extra_volunteer)
    self.name().==(extra_volunteer.name()) # HELLA don't like this line.&(self.list_id().==(extra_volunteer.list_id())
  end
end
