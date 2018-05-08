require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = create(:user)
  end

  # after(:all) do
  #   User.destroy_all
  # end

  it "is valid with valid attributes" do
    expect(@user).to be_valid
  end

  it "has a unique name" do
    user2 = build(:user, name: "User")
    expect(user2).to_not be_valid
  end

  it "has a unique email" do
    user2 = build(:user, email: "user@gmail.com")
    expect(user2).to_not be_valid
  end

  it "is not valid without a name" do
    user2 = build(:user, name: nil)
    expect(user2).to_not be_valid
  end

  it "is not valid without an email" do
    user2 = build(:user, email: nil)
    expect(user2).to_not be_valid
  end

  it "is not valid if password has fewer than 8 characters" do
    user2 = build(:user, password: "1234567")
    expect(user2).to_not be_valid
  end

end
