require 'rails_helper'

RSpec.describe Ride, type: :model do

  before(:each) do
    @user = create(:user)
    @ride = create(:ride, organizer: @user)
  end

  it "is valid with valid attributes" do
    expect(@ride).to be_valid
  end

  it "is not valid without a title" do
    @ride = build(:ride, title: nil, organizer: @user)

    expect(@ride).to_not be_valid
  end

  it "is not valid without a date" do
    @ride = build(:ride, date: nil, organizer: @user)

    expect(@ride).to_not be_valid
  end

  it "is not valid without a duration" do
    @ride = build(:ride, duration: nil, organizer: @user)

    expect(@ride).to_not be_valid
  end

end
