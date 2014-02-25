require 'spec_helper'

describe "a user can share a playlist" do
  let(:creator) do 
    User.create!({
      email: "j@k.co",
      password: "jeff",
      password_confirmation: "jeff",
      first_name: "Jeff",
      last_name: "K",
      dob: Date.today,
      balance: 100.00
    }) 
  end
  let(:shared) do 
    User.create!({
      email: "k@k.co",
      password: "jeff",
      password_confirmation: "jeff",
      first_name: "Keff",
      last_name: "K",
      dob: Date.today,
      balance: 100.00
    }) 
  end
  let(:shunned) do 
    User.create!({
      email: "l@k.co",
      password: "jeff",
      password_confirmation: "jeff",
      first_name: "Leff",
      last_name: "K",
      dob: Date.today,
      balance: 100.00
    }) 
  end

  let(:playlist) do
    Playlist.create!({
      title: "Jamz",
      user: creator
      })
  end

  # it "creates a playlist" do
  #   login(creator)
  #   visit user_path(creator)
  #   click_link "Create Playlist"
  #   fill_in "Title", with: "Jamz"
  #   click_button "Create"
  # end

  it "shares a playlist" do
    login(creator)
    playlist
    creator.playlists<<playlist
    shared
    shunned
    save_and_open_page
    visit user_path(creator)
    #binding.pry
    save_and_open_page
    click_link "Share Playlist"
    select shared.name, from: "playlist_users"
    

    within ".users" do
      expect(page).to have_content "Keff"
      end

    click_button "Share"
    visit playlist_path(playlist)
    click_link "Log Out Jeff!"

  end

  def login(user)
    visit "/login"

    fill_in :email, with: user.email
    fill_in :password, with: user.password
    # save_and_open_page
    click_button "Log in!"
  end

  def logout(user)
    visit ""
  end
end
