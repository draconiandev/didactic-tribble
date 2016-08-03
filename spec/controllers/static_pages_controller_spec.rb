describe StaticPagesController, type: :controller do

  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #contact" do
    it "returns http success" do
      get :contact
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #terms" do
    it "returns http success" do
      get :terms
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #policies" do
    it "returns http success" do
      get :policies
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #help" do
    it "returns http success" do
      get :help
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #handcrafted" do
    it "returns http success" do
      get :handcrafted
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #weekend" do
    it "returns http success" do
      get :weekend
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #team_outing" do
    it "returns http success" do
      get :team_outing
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #elderly" do
    it "returns http success" do
      get :elderly
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #women_special" do
    it "returns http success" do
      get :women_special
      expect(response).to have_http_status(:success)
    end
  end
end
