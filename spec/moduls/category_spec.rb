require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:example) do
    @rex = User.create(name: 'said', email: 'test@gmail.com', password: 'pw1234')
  end
  subject { Category.new(name: 'Food', icon: 'https://source.unsplash.com/random/100x100', author_id: @rex.id) }

  before { subject.save }

  it 'Name is required' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Name is valid' do
    subject.name = 'Food'
    expect(subject).to be_valid
  end

  it 'Icon is required' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end

  it 'Icon is valid' do
    subject.icon = 'https://source.unsplash.com/random/100x100'
    expect(subject).to be_valid
  end

  it 'Author is required' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end

  it 'Author should exist' do
    subject.author_id = 10
    expect(subject).to_not be_valid
  end

  it 'Author value should be Int and Exist ' do
    subject.author_id = @rex.id
    expect(subject).to be_valid
  end

  it 'Author value should not be String' do
    subject.author_id = '1'
    expect(subject).to_not be_valid
  end
end
