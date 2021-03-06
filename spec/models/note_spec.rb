require 'rails_helper'

RSpec.describe Note, type: :model do
  before(:each) do
    @note = FactoryBot.create(:note)
  end

  it "is creatable using a Factory" do
    expect(@note).to be_valid
  end

  it "is not valid without a title" do
    @note.title = ""
    expect(@note).not_to be_valid
  end

  it "is not valid without content" do
    @note.content = ""
    expect(@note).not_to be_valid
  end

  it "is not valid without a user" do
    @note.user = nil
    expect(@note).not_to be_valid
  end

  it "persists a user" do
    expect(@note.user).to be_instance_of(User)
  end

  it "can be destroyed without interfering with the connected user" do
    user = @note.user
    expect { @note.destroy }.to_not raise_error
    expect { user.reload }.to_not raise_error
  end
end
