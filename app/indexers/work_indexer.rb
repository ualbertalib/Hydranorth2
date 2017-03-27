class WorkIndexer < CurationConcerns::WorkIndexer
  def generate_solr_document
    super.tap do |solr_doc|
      if object.title && !object.title.empty?
        Solrizer.insert_field(solr_doc, 'sortable_title', object.title.first.downcase, :stored_sortable)
      end

      solr_doc[Solrizer.solr_name('member_of_paths', :descendent_path)] = object.member_of_paths
    end
  end
end
