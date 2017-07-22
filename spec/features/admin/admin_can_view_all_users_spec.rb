require 'rails_helper'

RSpec.feature "admin can view all users" do
  scenario "when on the index page" do
    admin = create(:admin, role: 1)
    user_1 = create(:user)
    user_2 = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    

  end
end
