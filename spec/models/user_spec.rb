require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {User.new}

  it 'can create a user from params' do
    params = {username: "someone", full_name: "Some One",
              password: "moop", is_mentor: true, phone: "123-456-7890"}
    expect(User.new(params).save!).to be(true)
  end
end
