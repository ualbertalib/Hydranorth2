class Hyrax::GenericWorksController < ApplicationController
  # Adds Hyrax behaviors to the controller.
  include Hyrax::CurationConcernController
  include Hyrax::WorksControllerBehavior

  self.curation_concern_type = GenericWork
end
