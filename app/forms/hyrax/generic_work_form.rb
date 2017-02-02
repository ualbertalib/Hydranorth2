class Hyrax::GenericWorkForm < Hyrax::Forms::WorkForm
  self.model_class = ::GenericWork
  self.terms += [:resource_type]
end
