require 'rails_helper'

RSpec.describe Status, type: :model do
  context "relationships" do
    it { should have_many(:notes) }
  end
end
