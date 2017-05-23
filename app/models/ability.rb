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
    # Limits deleting objects to a the admin user
    #
    # if current_user.admin?
    #   can [:destroy], ActiveFedora::Base
    # end

    # Limits creating new objects to a specific group
    #
    # if user_groups.include? 'special_group'
    #   can [:create], ActiveFedora::Base
    # end
    can :manage, :all if admin?
  end
end
