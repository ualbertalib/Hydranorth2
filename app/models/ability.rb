class Ability
  include Hydra::Ability
  include CurationConcerns::Ability
  include Sufia::Ability

  # extend CurationConcerns ability logic with the knowledge that CollectionNorth::Collection/communities
  # count as curation concerns
  include CollectionNorth::Ability

  self.ability_logic += [:everyone_can_create_curation_concerns]

  # Define any customized permissions here.
  def custom_permissions; end
end
