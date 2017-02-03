# Generated via
#  `rails generate curation_concerns:work GenericWork`
class GenericWork < ActiveFedora::Base
  include Hyrax::WorkBehavior
  include Hyrax::BasicMetadata

  self.human_readable_type = 'Work'
  self.indexer = ::WorkIndexer

  # Change this to restrict which works can be added as a child.
  # self.valid_child_concerns = []
  validates :title, presence: { message: 'Your work must have a title.' }
end
