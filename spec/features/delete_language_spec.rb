require 'rails_helper'

feature 'delete language process', type: :feature, js: true do
  background do
    user = create(:user, admin: true)
    login_as user
  end

  scenario 'admin deletes language successfully'
end
