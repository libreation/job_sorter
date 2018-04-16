require './lib/job'

class InputParser
  def self.parse(jobs)
    parsed_jobs = {}
    jobs.gsub!('end', '')
    jobs.split("\n").each do |job|
      single_job = Job.new(*job.split('=>').map(&:strip))
      parsed_jobs[single_job.name] = single_job
    end

    parsed_jobs
  end
end