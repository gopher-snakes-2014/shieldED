describe Event do
  describe "attributes" do
    it { should respond_to :details }
    it { should respond_to :submitter }
    it { should respond_to :offender }
    it { should respond_to :location }
    it { should respond_to :date }
    it { should respond_to :created_at }
    it { should respond_to :updated_at }
    it { should respond_to :event_photo }
    it { should respond_to :user_id     }
  end

  describe "validations" do
    it { should validate_presence_of :details }
  end

  describe "associations" do
    it { should belong_to :user }
    it { should have_many :event_tags }
    it { should have_many :tags, through: :event_tags }
  end
end
