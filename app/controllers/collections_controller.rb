class CollectionsController < ApplicationController
  include CurationConcerns::CollectionsControllerBehavior
  include Sufia::CollectionsControllerBehavior

  def add_members_to_collection(collection = nil)
    collection ||= @collection
    collection.add_members batch
    collection.add_member_objects batch
  end
end

