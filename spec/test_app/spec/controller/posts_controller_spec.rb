require 'rails_helper'
include ActiveJob::TestHelper

RSpec.describe PostsController, type: :controller do
  before do
    ActiveJob::Base.queue_adapter = :test
    @user = create(:user)
    @post = create(:post, user: @user)
  end

  it "enqueues specified custom actions" do
    get 'popular', session: {user_id: @user.id}
    expect(ActivityMonitor::SaveActivityJob).to have_been_enqueued.with(@user.id, 'posts', 'popular')
  end

  it "does not enqueue unspecified actions" do
    get 'index', session: {user_id: @user.id}
    expect(ActivityMonitor::SaveActivityJob).not_to have_been_enqueued
  end


  it 'saves custom activities' do
    ActivityMonitor::SaveActivityJob.perform_now(@user.id, 'posts', 'popular')
    expect(PublicActivity::Activity.where(owner_id: @user.id, key: 'user.posts-popular')).to exist
  end
end
