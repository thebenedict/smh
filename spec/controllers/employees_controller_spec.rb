# == Schema Information
#
# Table name: employees
#
#  id                  :integer          not null, primary key
#  full_name           :string
#  common_name         :string
#  primary_phone       :string
#  alternate_phone     :string
#  availability        :text             default([]), is an Array
#  roles               :text             default([]), is an Array
#  english_proficiency :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  employee_consent    :boolean          default(FALSE)
#

require 'rails_helper'

RSpec.describe EmployeesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      employer = FactoryGirl.create(:employer)
      employer.user.confirm
      sign_in employer.user

      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
