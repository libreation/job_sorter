class Job
  attr_accessor :name, :dependancy

  def initialize(name, dep=nil)
    raise ArgumentError.new('Jobs can not depend on themselves') if (dep == name)

    @name = name
    @dependancy = (dep == '') ? nil : dep
  end

  def dependancy?
    !!@dependancy
  end
end