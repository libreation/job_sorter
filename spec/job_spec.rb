require './lib/job'

describe Job do
  it 'is invalid without a name' do
    expect{ Job.new }.to raise_error(ArgumentError)
  end

  it 'returns its name' do
    expect(Job.new(:test).name).to eq(:test)
  end

  it 'can not depend on itself' do
    expect{ Job.new('a', 'a') }.to raise_error(ArgumentError)
  end

  it "returns nil dependancy" do
    expect(Job.new(:a).dependancy).to eq(nil)
  end

  it "returns the dependncy when asked" do
    expect(Job.new(:a, :b).dependancy).to eq(:b)
  end
end