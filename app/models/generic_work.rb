# Generated via
#  `rails generate curation_concerns:work GenericWork`
class GenericWork < ActiveFedora::Base
  include ::CurationConcerns::WorkBehavior
  include ::CurationConcerns::BasicMetadata
  include Sufia::WorkBehavior

  self.human_readable_type = 'Work'
  self.indexer = ::WorkIndexer

  # Change this to restrict which works can be added as a child.
  # self.valid_child_concerns = []
  validates :title, presence: { message: 'Your work must have a title.' }

  # TODO A real predicate for this -- mb
  class MyTerms < ::RDF::Vocabulary("http://terms.library.ualberta.ca/id/")
    term :foo
  end

  property :member_of_paths, predicate: MyTerms.foo, multiple: true do |index|
    index.as :descendent_path
  end
end
