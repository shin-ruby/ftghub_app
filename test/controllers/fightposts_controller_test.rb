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
end
