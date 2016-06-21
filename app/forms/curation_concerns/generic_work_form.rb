# Generated via
#  `rails generate curation_concerns:work GenericWork`
class CurationConcerns::GenericWorkForm < Sufia::Forms::WorkForm
  self.model_class = ::GenericWork
  self.terms += [:resource_type]
end
