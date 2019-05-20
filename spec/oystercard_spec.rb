require 'oystercard'

describe Oystercard do

  it 'has a default balance of 0' do
    expect(subject.balance).to eq(0)
  end

  it 'can be topped up' do
    subject.top_up(10)
    expect(subject.balance).to eq(10)
  end

  it 'has a limit of £90' do
    subject.top_up(90)
    expect{ subject.top_up(10) }.to raise_error "limit is £#{Oystercard::LIMIT}"
  end

  it 'can pay for travel' do
    card = Oystercard.new(50)
    card.deduct(40)
    expect(card.balance).to eq(10)
  end

  it 'can start a journey' do
    subject.touch_in
    expect(subject.journey).to be true
  end

  it 'can end a journey' do
    subject.touch_out
    expect(subject.journey).to be false
  end
end
