describe Event do
  describe "attributes" do
    it { should respond_to :details }
    it { should respond_to :submitter }
    it { should respond_to :offender }
    it { should respond_to :location }
    it { should respond_to :date }
    it { should respond_to :created_at }
    it { should respond_to :updated_at }
  end
end