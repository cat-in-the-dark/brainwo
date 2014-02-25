require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do
    before do
      get :index
    end

    it { expect(response).to render_template :index }
  end

end
