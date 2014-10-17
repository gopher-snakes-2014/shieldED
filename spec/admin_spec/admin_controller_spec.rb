describe 'if the user is an admin' do
  xcontext 'when logged in' do
    it { is_expected.to respond_with 200 }
  end
end
