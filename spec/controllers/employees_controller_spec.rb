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
