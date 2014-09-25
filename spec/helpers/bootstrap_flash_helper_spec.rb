require "rails_helper"

describe BootstrapFlashHelper do

  it "ALERT TYPES constat" do
    expect(BootstrapFlashHelper::ALERT_TYPES).to eq([:success, :info, :warning, :danger])
  end

  it "sets class as alert-success in the div" do
    allow(helper).to receive(:flash).and_return(notice: "this is a flash notice msg")
    expect(helper.bootstrap_flash).to match('alert-success')
  end

  it "sets class as alert-danger in the div" do
    allow(helper).to receive(:flash).and_return(alert: "this is a flash alert msg")
    expect(helper.bootstrap_flash).to match('alert-danger')
  end

  it "sets class as alert-danger in the div" do
    allow(helper).to receive(:flash).and_return(error: "this is a flash error msg")
    expect(helper.bootstrap_flash).to match('alert-danger')
  end

  it "sets class as alert-info in the div" do
    allow(helper).to receive(:flash).and_return(info: "this is a flash info msg")
    expect(helper.bootstrap_flash).to match('alert-info')
  end

  it "returns empty string when given an invalid flash type" do
    allow(helper).to receive(:flash).and_return(something: "this is a random flash")
    expect(helper.bootstrap_flash).to eq("")
  end
end
