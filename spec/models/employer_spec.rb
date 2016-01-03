# == Schema Information
#
# Table name: employers
#
#  id                            :integer          not null, primary key
#  first_name                    :string
#  full_name                     :string
#  organization                  :string
#  user_id                       :integer
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  hosted_avatar_url             :string
#  submitted_avatar_file_name    :string
#  submitted_avatar_content_type :string
#  submitted_avatar_file_size    :integer
#  submitted_avatar_updated_at   :datetime
#

require 'rails_helper'

RSpec.describe Employer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
