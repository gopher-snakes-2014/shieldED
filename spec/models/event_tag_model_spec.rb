describe EventTag do
  describe "attributes" do
    it { should respond_to :event_id }
    it { should respond_to :tag_id }
  end

  describe "validations" do
    it { should validate_presence_of :event_id }
    it { should validate_presence_of :tag_id }
    it { should validate_uniqueness_of(:tag_id).scoped_to(:event_id) }
  end

  describe "associations" do
    it { should belong_to :event }
    it { should belong_to :tag }
  end
end
