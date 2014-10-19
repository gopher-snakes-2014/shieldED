describe Tag do
  describe "attributes" do
    it { should respond_to :tag_name }
  end

  describe "validations" do
    it { should validate_presence_of :tag_name }
  end

  describe "associations" do
    it { should belong_to :event_tags }
    it { should belong_to :event, through: :event_tags }
  end
end
