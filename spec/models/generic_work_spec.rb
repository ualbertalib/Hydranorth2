# Generated via
#  `rails generate curation_concerns:work GenericWork`
require 'rails_helper'

RSpec.describe GenericWork do
  let(:work) { FactoryGirl.build(:work) }

  it 'should have our indexer' do
    expect(work.indexer).to eq WorkIndexer
  end

  it 'indexes sortable title' do
    expect(work.to_solr).to have_key('sortable_title_ssi')
  end
end
