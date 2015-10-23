# == Schema Information
#
# Table name: employers
#
#  id           :integer          not null, primary key
#  first_name   :string
#  other_names  :string
#  organization :string
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe Employer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
