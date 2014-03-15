require 'spec_helper'

describe QuizzesController do

  describe "GET 'index'" do
    before do
      get :index
    end

    it { expect(response).to render_template :index }
  end

  describe "GET 'show'" do
    let(:quiz) { FactoryGirl.create :quiz }
    before do
      get :show, id: quiz.id
    end

    it { expect(response).to render_template :show }
  end

  describe "GET 'show' with invalid quiz id" do
    let(:quiz) { FactoryGirl.create :quiz }
    before do
      get :show, id: quiz.id.next
    end

    it { expect(response).to redirect_to :root }
  end
end
