require 'rails_helper'

RSpec.describe Ride, type: :model do

  before(:each) do
    @user = create(:user)
    @ride = create(:ride, organizer: @user)
  end

  it "is valid with valid attributes" do
    expect(@ride).to be_valid
  end

end
