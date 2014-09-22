require "rails_helper"

describe MoviesController do
  let(:valid_attributes) do
    {
      name: "Power",
      description: "Some description",
      tag_line: "this is a tag line"
    }
  end

  let(:invalid_attributes) do
    {
      name: "",
      description: "some thing"
    }
  end

  describe "GET new" do
    it "renders new template" do
      get :new
      expect(response).to render_template("new")
    end

    it "assigns @movie" do
      movie = Movie.new
      allow(Movie).to receive(:new) { movie }
      get :new
      expect(assigns(:movie)).to eq(movie)
    end

    # which one makes more sense?
    it "assigns @movie" do
      get :new

      expect(assigns(:movie)).to be_new_record
      expect(assigns(:movie)).to be_a(Movie)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Movie" do
        expect do
          post :create, movie: valid_attributes
        end.to change(Movie, :count).by(1)
      end

      it "assigns a newly created movie as @movie" do
        post :create, movie: valid_attributes
        expect(assigns(:movie)).to be_a(Movie)
        expect(assigns(:movie)).to be_persisted
      end

      it "redirects to root path" do
        post :create, movie: valid_attributes
        expect(response).to redirect_to(root_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved movie as @movie" do
        post :create, movie: invalid_attributes
        expect(assigns(:movie)).to be_a_new(Movie)
      end

      it "re-renders the 'new' template" do
        post :create, movie: invalid_attributes
        expect(response).to render_template("new")
      end
    end
  end
end
