require 'rails_helper'

feature 'registering as a new student' do
  scenario 'the user sees a link to register on the home page' do
    visit '/'

    click_link('Register')
    expect(page).to have_selector(:css, 'form.registration')
  end
end


