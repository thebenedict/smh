require 'rails_helper'

RSpec.describe EmploymentsController, type: :controller do

  describe "GET #index" do
    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      employer = FactoryGirl.create(:employer)
      employer.user.confirm
      sign_in employer.user
    end

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
