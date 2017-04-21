require 'rails_helper'

feature 'visiting the homepage' do
  scenario 'the user sees a welcome message' do
    visit '/'

    expect(page).to have_content('Welcome')
  end
end
