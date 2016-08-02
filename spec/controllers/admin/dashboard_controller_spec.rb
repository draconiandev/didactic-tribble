describe Admin::DashboardController, type: :controller do
  login_admin 

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #activity" do
    it "returns http success" do
      get :activity
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #category" do
    it "returns http success" do
      get :category
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destination" do
    it "returns http success" do
      get :destination
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #vendor" do
    it "returns http success" do
      get :vendor
      expect(response).to have_http_status(:success)
    end
  end

end
