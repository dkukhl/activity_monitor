require 'rails_helper'

RSpec.describe ActivityMonitor::MonitorController, type: :controller do
  routes { ActivityMonitor::Engine.routes }
  before do
    @admin = create(:admin_user)
    @user = create(:user)
  end

  it "admin user can access monitor" do
    get 'index', session: {user_id: @admin.id}
    expect(response.status).to eq 200
  end

  it "other users cannot acces monitor" do
    get 'index', session: {user_id: @user.id}
    expect(response.status).to eq 401
  end

  it "monitor displays activity keys" do
    create(:post, user: @user)
    get 'show', params:{key: 'post.create'}, session: {user_id: @admin.id}
    expect(response.status).to eq 200
  end



end
