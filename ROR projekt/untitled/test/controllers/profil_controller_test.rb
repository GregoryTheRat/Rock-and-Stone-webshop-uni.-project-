require "test_helper"

class ProfilControllerTest < ActionDispatch::IntegrationTest
  test "should get profil-adatok" do
    get profil_profil-adatok_url
    assert_response :success
  end
end
