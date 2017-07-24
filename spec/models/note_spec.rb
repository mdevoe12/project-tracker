require 'rails_helper'

RSpec.describe Note, type: :model do
  context "validations" do
    it {is_expected.to validate_presence_of(:title) }
  end

  context "relationships" do
    it { should belong_to(:project) }
    it { should belong_to(:status)  }
  end
end
