require 'rails_helper'

RSpec.describe Topic, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it { is_expected.to validate_presence_of (:title) }
  it { is_expected.to validate_length_of (:title).is_at_least(5) }
end
