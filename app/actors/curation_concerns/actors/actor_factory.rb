# this isn't composable, so I'm monkeypatching it to add some composability
# based on https://github.com/projecthydra/curation_concerns/blob/v1.6.1/app/services/curation_concerns/actors/actor_factory.rb
module CurationConcerns
  module Actors
    class ActorFactory

      @@actors =[AddToCollectionActor,
                 AddToWorkActor,
                 AssignRepresentativeActor,
                 AttachFilesActor,
                 ApplyOrderActor,
                 InterpretVisibilityActor,
                 ->(curation_concern) {model_actor(curation_concern)}]

      def self.append_actor(actor_class)
        @@actors << actor_class
      end

      def self.prepend_actor(actor_class)
        @@actors.unshift actor_class
      end

      def self.remove_actor(actor_class)
        @@actors.delete actor_class
      end

      def self.build(curation_concern, current_user)
        Actors::ActorStack.new(curation_concern,
                               current_user,
                               stack_actors(curation_concern))
      end

      def self.stack_actors(curation_concern)
        @@actors.collect{|actor| actor.is_a?(Class) ? actor : actor.call(curation_concern)}
      end

      def self.model_actor(curation_concern)
        actor_identifier = curation_concern.class.to_s.split('::').last
        "CurationConcerns::Actors::#{actor_identifier}Actor".constantize
      end
    end
  end
end
