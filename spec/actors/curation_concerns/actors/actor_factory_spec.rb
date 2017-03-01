# Generated via
#  `rails generate curation_concerns:work GenericWork`
require 'rails_helper'

EXPECTED_RUNTIME_ACTOR_STACK = [CollectionNorth::AddAsMemberOfCollectionsActor,
                                CurationConcerns::Actors::AddToWorkActor,
                                CurationConcerns::Actors::AssignRepresentativeActor,
                                CurationConcerns::Actors::AttachFilesActor,
                                CurationConcerns::Actors::ApplyOrderActor,
                                CurationConcerns::Actors::InterpretVisibilityActor,
                                CurationConcerns::Actors::GenericWorkActor]

RSpec.describe CurationConcerns::Actors::ActorFactory do
  let(:work) {FactoryGirl.build(:work)}

  it 'has the expected actors do' do
    actor_stack = CurationConcerns::Actors::ActorFactory.build(work,nil)

    expect(actor_stack.first_actor_class).to eq EXPECTED_RUNTIME_ACTOR_STACK[0]
    expect(actor_stack.more_actors).to match_array EXPECTED_RUNTIME_ACTOR_STACK[1..-1]
  end

  it 'prepends and removes actors properly' do
    class APretendActor; end

    CurationConcerns::Actors::ActorFactory.prepend_actor APretendActor
    actor_stack = CurationConcerns::Actors::ActorFactory.build(work,nil)
    expect(actor_stack.first_actor_class).to eq APretendActor
    expect(actor_stack.more_actors).to match_array EXPECTED_RUNTIME_ACTOR_STACK

    CurationConcerns::Actors::ActorFactory.remove_actor APretendActor
    actor_stack = CurationConcerns::Actors::ActorFactory.build(work,nil)
    expect(actor_stack.first_actor_class).to eq EXPECTED_RUNTIME_ACTOR_STACK[0]
    expect(actor_stack.more_actors).to match_array EXPECTED_RUNTIME_ACTOR_STACK[1..-1]
  end

  it 'appends and removes actors properly' do
    class APretendActor; end

    CurationConcerns::Actors::ActorFactory.append_actor APretendActor
    actor_stack = CurationConcerns::Actors::ActorFactory.build(work,nil)
    expect(actor_stack.first_actor_class).to eq  EXPECTED_RUNTIME_ACTOR_STACK[0]
    expect(actor_stack.more_actors).to match_array EXPECTED_RUNTIME_ACTOR_STACK[1..-1] + [APretendActor]

    CurationConcerns::Actors::ActorFactory.remove_actor APretendActor
    actor_stack = CurationConcerns::Actors::ActorFactory.build(work,nil)
    expect(actor_stack.first_actor_class).to eq EXPECTED_RUNTIME_ACTOR_STACK[0]
    expect(actor_stack.more_actors).to match_array EXPECTED_RUNTIME_ACTOR_STACK[1..-1]
  end
end
