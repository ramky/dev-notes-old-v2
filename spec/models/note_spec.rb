require 'rails_helper'

RSpec.describe Note, type: :model do
  it { should belong_to(:topic) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:text)  }
  it { should validate_presence_of(:topic) }
  it { should validate_presence_of(:note_type) }
end
