require './lib/input_parser'

describe InputParser do
  single_parsed_job = InputParser.parse('a => b')

  it 'creates a jobs hash' do
    expect(single_parsed_job.keys).to include('a')
  end

  it 'assign job name correctly' do
    expect(single_parsed_job['a'].name).to eq('a')
  end

  it 'assings correct dependancy' do
    expect(single_parsed_job['a'].dependancy).to eq('b')
  end

  multiple_parsed_jobs = InputParser.parse("a => b \n b => \n c => ")

  it 'creates the correct number of jobs' do
    expect(multiple_parsed_jobs.length).to eq(3)
  end

  it 'assigns job name correctly for multiple jobs' do
    expect(multiple_parsed_jobs.values.map(&:name)).to eq(['a', 'b', 'c'])
  end
end