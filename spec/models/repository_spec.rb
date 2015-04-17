require 'rails_helper'

describe Repository, type: :model do
  it { is_expected.to have_many :comments }
  it { is_expected.to have_many :commits }
end
