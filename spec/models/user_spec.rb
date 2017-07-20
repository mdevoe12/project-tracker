require 'rails_helper'

RSpec.describe User, type: :model do
  it "can be created as an admin" do
    admin = create(:user, username: "admin steve", password: "steve", role: 1)

    expect(admin.role).to eq("admin")
    expect(admin.admin?).to be_truthy
  end

  it "can be created as a default user" do
    user = create(:user, password: "12345")

    expect(user.role).to eq("default")
    expect(user.default?).to be_truthy
  end
end
