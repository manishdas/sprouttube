require 'spec_helper'

describe Video do
  it { should belong_to :person }
  it { should validate_presence_of(:path) }
  it { should validate_presence_of(:category) }
end

# == Schema Information
#
# Table name: videos
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  category    :string(255)
#  description :text
#  path        :string(255)
#  hits        :integer
#  likes       :integer
#  created_at  :datetime
#  updated_at  :datetime
#  review_id   :integer
#  tags        :string(255)
#

