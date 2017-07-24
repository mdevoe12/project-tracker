require 'rails_helper'

RSpec.describe Tagging, type: :model do
  context "relationships" do
    it { should belong_to(:tag) }
    it { should belong_to(:project) }
  end
end
