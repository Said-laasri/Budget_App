require 'rails_helper'

RSpec.describe CategoryPurchase, type: :model do
  before(:example) do
    @said = User.create(name: 'said', email: 'test@gmail.com', password: 'pw1234')
    @purchase = Purchase.create(name: 'KFC chekin', amount: 100, author_id: @said.id)
    @category = Category.create(name: 'Food', icon: 'https://source.unsplash.com/random/100x100', author_id: @said.id)
  end

  subject { CategoryPurchase.new(category_id: @category.id, purchase_id: @purchase.id) }

  before { subject.save }

  it 'Category ID is required' do
    subject.category_id = nil
    expect(subject).to_not be_valid
  end

  it 'Purchase ID is required' do
    subject.purchase_id = nil
    expect(subject).to_not be_valid
  end

  it 'Category ID should NOT be String' do
    subject.category_id = 'aaa'
    expect(subject).to_not be_valid
  end

  it 'Purchase ID should NOT be String' do
    subject.purchase_id = 'bbb'
    expect(subject).to_not be_valid
  end

  it 'Category ID should be Int and Must Exist' do
    subject.category_id = @category.id
    expect(subject).to be_valid
  end

  it 'Purchase ID should NOT be Int and Must Exist' do
    subject.purchase_id = @purchase.id
    expect(subject).to be_valid
  end
end
