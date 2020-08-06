require 'rails_helper'

RSpec.describe TestController, type: :controller do

  describe "GET #method1" do
    it "returns http success" do
      get :method1
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #method2" do
    it "returns http success" do
      get :method2
      expect(response).to have_http_status(:success)
    end
  end

end
