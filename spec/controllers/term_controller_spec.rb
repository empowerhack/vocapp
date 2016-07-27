require 'rails_helper'

describe TermsController, type: :controller do
  let!(:term) {FactoryGirl.create(:term)}

  describe "GET term" do
      it "gets term by id " do
        term = FactoryGirl.create(:term)
        get :show, id: term
        assigns(:term).should eq(term)
      end

      it "" do

      end
    end
end
