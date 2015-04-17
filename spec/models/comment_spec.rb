require 'rails_helper'

describe Comment, type: :model do
  it { is_expected.to belong_to :repository }
  it { is_expected.to belong_to :commit }

  it { is_expected.to delegate_method(:committer).to(:commit) }
end
