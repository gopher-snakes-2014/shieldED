describe User do
  describe "attributes" do
    it { should respond_to :username        }
    it { should respond_to :password_hash   }
  end

  describe "validations" do
    it { should validate_uniqueness_of :username }
  end

  describe "associations" do
    it { should have_many :events }
  end
end
