require 'rails_helper'

RSpec.describe "admins can see all users" do
  context "as admin" do
    it "allows admins to see all users" do
      admin = create(:user, username: "admin steve", password: "steve", role: 1)
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_users_path

      expect(page).to have_content("Admin Console - Users Index")
      expect(page).to have_content(user.username)
    end
  end

  context "as default" do
    it "does not allow default users to see admin console - users index" do
      user = create(:user, username: "admin steve", password: "steve")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_users_path

      expect(page).to_not have_content("Admin Console - Users Index")
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
