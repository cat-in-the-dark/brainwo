require 'spec_helper'

describe Owner::QuestionsController do
  let(:owner) { FactoryGirl.create :owner }
  let(:quiz) { FactoryGirl.create :quiz, owner: owner }

  context 'when user is signed in' do
    let(:question) { FactoryGirl.create :question, quiz: quiz }

    before do
      controller.send(:sign_in, owner)
    end

    describe "GET 'show'" do     
      before do
        get :show, id: question.id
      end

      it { expect(response).to render_template :show }
    end

    describe "GET 'new'" do
      before do
        get :new, quiz_id: quiz.id
      end

      it { expect(response).to render_template :new }
    end

    describe "GET 'edit'" do
      before do
        get :edit, id: question.id
      end

      it { expect(response).to render_template :edit } 
    end
  end


  context 'when user is not signed in' do
    let(:question) { FactoryGirl.create :question, quiz: quiz }

    describe "GET 'show'" do
      before do
        get :show, id: question.id
      end

      it { expect(response).to redirect_to new_owner_session_path }
    end

    describe "GET 'new'" do
      before do
        get :new
      end

      it { expect(response).to redirect_to new_owner_session_path }
    end

    describe "GET 'edit'" do
      before do
        get :edit, id: question.id
      end

      it { expect(response).to redirect_to new_owner_session_path } 
    end
  end

end
