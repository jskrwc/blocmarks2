require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it { is_expected.to validate_presence_of (:url) }
  it { is_expected.to validate_length_of (:url).is_at_least(4) }
end
