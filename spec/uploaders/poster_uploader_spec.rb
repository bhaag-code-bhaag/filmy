require "rails_helper"
require "carrierwave/test/matchers"

describe PosterUploader do
  include CarrierWave::Test::Matchers

  before do
    PosterUploader.enable_processing = true
    @uploader = PosterUploader.new(Movie.new, :poster)
  end

  after do
    PosterUploader.enable_processing = false
    @uploader.remove!
  end

  context 'the thumb version' do
    it "should scale down a landscape image to be exactly 214 by 317 pixels" do
      poster_path = File.expand_path("../../fixtures/images/maze_runner.jpg", __FILE__)
      @uploader.store!(File.open(poster_path))
      expect(@uploader.thumb).to have_dimensions(214, 317)
    end
  end

  context "Invalid files" do
    it "should raise exception when given invalid file" do
      poster_path = File.expand_path("../../fixtures/images/invalid_image.txt", __FILE__)
      expect do
        @uploader.store! File.open(poster_path)
      end.to raise_error(CarrierWave::IntegrityError)
    end
  end
end
