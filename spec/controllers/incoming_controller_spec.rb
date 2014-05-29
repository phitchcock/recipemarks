require  'spec_helper'

describe IncomingController do
  let(:email) {{from: 'test@example.com', subject: 'new link', 'stripped-text' => 'http://example.com'}}

  context 'given an email from a known user' do
    let!(:user) {
      u = User.new(email: email[:from], password: '1234567890')
      u.skip_confirmation!
      u.save!
      u
    }

    it 'creates a bookmark given a name in the subject and a url in the body' do
      expect{
        post :create, email
      }.to change(Bookmark, :count).by(1)
    end

    it 'creates a bookmark for the right user' do
      expect{
        post :create, email
      }.to change(user.bookmarks, :count).by(1)
    end

    it 'creates a bookmark with the right url' do
      post :create, email
      expect(Bookmark.first.url).to eq('http://example.com')
    end

    it 'creates a bookmark with the right name' do
      post :create, email
      expect(Bookmark.first.name).to eq('new link')
    end

    it 'does not create a bookmark given a url in the body but no subject' do
      email['subject'] = ''
      expect{
        post :create, email
      }.to change(Bookmark, :count).by(0)
    end

    it 'does not create a bookmark without a url' do
      email['stripped-text'] = ''
      expect{
        post :create, email
      }.to change(Bookmark, :count).by(0)
    end

    it 'sends an email notifying the sender of bookmark save failure'
  end

  context 'given an email from an unknown user' do
    it 'does not create a bookmark' do
      expect{
        post :create, email
      }.to change(Bookmark, :count).by(0)
    end
  end
end
