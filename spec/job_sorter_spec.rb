require './lib/job_sorter'

describe JobSorter do
  it 'returns an empty collection when no jobs are given' do
    expect(JobSorter.process("")).to eq('')
  end

  it 'returns the job when single input is given' do
    expect(JobSorter.process("a => ")).to eq('a')
  end

  it 'puts c before b' do
    jobs = JobSorter.process("a => \n b => c \n c =>")
    expect(jobs).to eq('acb')
  end

  jobs = JobSorter.process("a => \n b => c \n c => f \n d => a \n e => b \n f => ")
  it 'sorts the jobs as per the dependancies' do
    expect(jobs).to eq('fcadbe')
  end

  job_spec = "a => \n b => c \n c => f \n d => a \n e => \n f => b"
  it 'raises an Error' do
    expect{ JobSorter.process(job_spec) }.to raise_error(ArgumentError)
  end
end