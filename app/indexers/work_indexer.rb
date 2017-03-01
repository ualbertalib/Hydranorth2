class WorkIndexer < CurationConcerns::WorkIndexer
  def generate_solr_document
    super.tap do |solr_doc|
      if object.title && !object.title.empty?
        Solrizer.insert_field(solr_doc, 'sortable_title', object.title.first.downcase, :stored_sortable)
      end
    end
  end
end
