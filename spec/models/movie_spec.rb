require "rails_helper"

describe Movie do
  describe "Validations" do
    it { expect(subject).to validate_presence_of :name }
  end
end
