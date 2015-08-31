require 'rails_helper'

RSpec.describe SubscribersController, type: :controller do

  describe "GET #index" do
    before do
      get :index
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders index view" do
      expect(response).to render_template(:index)
    end
  end

  describe "GET #create" do
    let!(:user) { FactoryGirl.create(:subscriber) }
    let(:params) { { email: "nyan@universe.com" } }

    before do
      get :create, params
    end

    it "returns http success" do
      expect(response).to have_http_status(:redirect)
    end

    it "redirects to index" do
      expect(response).to redirect_to(root_path)
    end

    context "when user doesn\'t exists" do

      it "assigns flash message" do
        expect(flash[:success]).to eq(I18n.t('application.messages.success'))
      end
    end

    context "when user already exists" do
      let(:params) { { email: user.email } }

      it "assigns flash message" do
        expect(flash[:danger]).to eq("Email has already been taken")
      end
    end

    context "when email is wrong" do
      let(:params) { { email: "evilcatgmail.com" } }

      it "assigns flash message" do
        expect(flash[:danger]).to eq("Email is invalid")
      end
    end
  end

end
