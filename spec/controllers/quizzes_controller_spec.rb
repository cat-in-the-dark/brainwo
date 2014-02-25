require 'spec_helper'

describe QuizzesController do

  describe "GET 'index'" do
    context 'when not signed in' do
      before do
        get :index
      end

      it { expect(response).to redirect_to(new_owner_session_path) }
    end
  end

end
