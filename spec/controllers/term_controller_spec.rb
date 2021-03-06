require 'rails_helper'

describe TermsController, type: :controller do
  let!(:term) { FactoryGirl.create(:term) }

  describe "GET term" do
    it "gets term by id " do
      get :show, id: term
      expect(assigns(:term)).to eq(term)
    end
  end
end
