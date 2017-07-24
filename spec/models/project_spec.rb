require 'rails_helper'

RSpec.describe Project, type: :model do
  context "validations" do
    it { is_expected.to   validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  context "relationships" do
    it { should have_many(:notes)    }
    it { should have_many(:taggings) }
    it { should have_many(:tags)     }
    it { should belong_to(:user)     }
  end

  scenario "tag_list returns list of tags" do
    user = create(:user)
    project = create(:project, user_id: user.id)
    tag_1 = project.tags.create(name: "doomsday plans")
    tag_2 = project.tags.create(name: "sharks with lasers")

    list = project.tag_list

    expect(list).to eq("#{tag_1.name}, #{tag_2.name}")
  end

  scenario "pie_chart returns array of statuses" do
    user = create(:user)
    project = create(:project, user_id: user.id)
    status_1 = create(:status, name: "In process")
    status_2 = create(:status, name: "Completed")
    note_1 = create(:note, project_id: project.id, status_id: status_1.id)
    note_2 = create(:note, project_id: project.id, status_id: status_2.id)

    array = project.pie_chart

    expect(array).to eq([[status_1.name, 1], [status_2.name, 1]])
  end

  scenario "completion_rate returns percentage complete" do
    user = create(:user)
    project = create(:project, user_id: user.id)
    status_1 = create(:status, name: "In process")
    status_2 = create(:status, name: "Completed")
    note_1 = create(:note, project_id: project.id, status_id: status_1.id)
    note_2 = create(:note, project_id: project.id, status_id: status_2.id)

    rate = project.completion_rate

    expect(rate).to eq("50.0 % Complete")
  end

end
