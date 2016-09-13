require 'rails_helper'

feature 'delete user process', type: :feature, js: true do
  background do
    user = create(:user, admin: true)
    login_as user
  end

  scenario 'deletes user with user role successfully'
  scenario "doesn't delete user with admin roke"
end
