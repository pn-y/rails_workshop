module ArticleStateMachine
  extend ActiveSupport::Concern

  included do
    state_machine :state, initial: :draft do
      state :draft
      state :on_moderation
      state :published

      event :moderate do
        transition draft: :on_moderation
      end

      event :publish do
        transition on_moderation: :published
      end

      event :make_draft do
        transition on_moderation: :draft
      end
    end
  end
end
