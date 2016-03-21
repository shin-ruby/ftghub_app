require 'test_helper'

class FightpostsControllerTest < ActionController::TestCase
  def setup
    @fightpost = fightposts(:orange)
  end

  test 'should redirect destroy for wrong fightpost' do
    sign_in(users(:michael))
    fightpost = fightposts(:ants)
    assert_no_difference 'Fightpost.count' do
      delete :destroy, params: { id: fightpost }
    end
    assert_redirected_to root_url
  end

  test 'create firstpost with picture upload' do
    sign_in(users(:michael))
    assert_difference('Fightpost.count') do
      post :create, params: { fightpost: { content: 'Test',
                                           picture: fixture_file_upload('files/user.jpg', 'image/jpg') } }
    end
  end
end
