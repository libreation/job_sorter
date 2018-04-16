require './lib/job'
require './lib/input_parser'
require 'set'

class JobSorter
  def self.process(jobs)
    sort!(InputParser.parse(jobs))
  end

  def self.circular_dependancy?(jobs)
    jobs.each do |job_name, job|
      dependancies = Set.new

      while(job = jobs[job.dependancy])
        break unless job.dependancy
        if dependancies.add?(job.name).nil?
          return true
        end
      end
    end
    return false
  end

  def self.sort!(jobs)
    raise ArgumentError.new('Circular dependancy occured.') if circular_dependancy?(jobs)

    sorted_jobs = []
    jobs.values.each do |job|
      if !sorted_jobs.include? job.name
        sorted_jobs << job.name
      end
      if job.dependancy
        sorted_jobs.delete(job.dependancy)
        sorted_jobs.insert(sorted_jobs.index(job.name), job.dependancy)
      end
    end
    sorted_jobs.join
  end
end
