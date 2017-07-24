require 'rails_helper'

RSpec.describe Tag, type: :model do
  context "relationships" do
    it { should have_many(:taggings) }
    it { should have_many(:projects) }
  end
end
