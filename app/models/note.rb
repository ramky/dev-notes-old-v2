class Note < ActiveRecord::Base
  belongs_to :topic

  validates_presence_of :title, :text, :topic, :note_type
end
