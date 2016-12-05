class WorkIndexer < CurationConcerns::WorkIndexer
  def generate_solr_document
    super.tap do |solr_doc|
      solr_doc[Solrizer.solr_name('test_path', :descendent_path)] = object.test_path
    end
  end
end
