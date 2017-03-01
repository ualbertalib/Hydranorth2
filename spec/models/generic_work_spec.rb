# Generated via
#  `rails generate curation_concerns:work GenericWork`
require 'rails_helper'

RSpec.describe GenericWork do
  it 'should have our indexer' do
    expect(subject.indexer).to eq WorkIndexer
  end

  it 'indexes sortable title' do
    expect(subject.to_solr).to have_key(:sortable_title)
  end
end
