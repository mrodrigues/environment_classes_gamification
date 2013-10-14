require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ProblemsController do

  before { login }

  # This should return the minimal set of attributes required to create a valid
  # Problem. As you add validations to Problem, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "text" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ProblemsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all problems as @problems" do
      problem = Problem.create! valid_attributes
      get :index, {}, valid_session
      assigns(:problems).should eq([problem])
    end
  end

  describe "GET show" do
    it "assigns the requested problem as @problem" do
      problem = Problem.create! valid_attributes
      get :show, {:id => problem.to_param}, valid_session
      assigns(:problem).should eq(problem)
    end
  end

  describe "GET new" do
    it "assigns a new problem as @problem" do
      get :new, {}, valid_session
      assigns(:problem).should be_a_new(Problem)
    end
  end

  describe "GET edit" do
    it "assigns the requested problem as @problem" do
      problem = Problem.create! valid_attributes
      get :edit, {:id => problem.to_param}, valid_session
      assigns(:problem).should eq(problem)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Problem" do
        expect {
          post :create, {:problem => valid_attributes}, valid_session
        }.to change(Problem, :count).by(1)
      end

      it "assigns a newly created problem as @problem" do
        post :create, {:problem => valid_attributes}, valid_session
        assigns(:problem).should be_a(Problem)
        assigns(:problem).should be_persisted
      end

      it "redirects to the created problem" do
        post :create, {:problem => valid_attributes}, valid_session
        response.should redirect_to(Problem.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved problem as @problem" do
        # Trigger the behavior that occurs when invalid params are submitted
        Problem.any_instance.stub(:save).and_return(false)
        post :create, {:problem => { "text" => "invalid value" }}, valid_session
        assigns(:problem).should be_a_new(Problem)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Problem.any_instance.stub(:save).and_return(false)
        post :create, {:problem => { "text" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested problem" do
        problem = Problem.create! valid_attributes
        # Assuming there are no other problems in the database, this
        # specifies that the Problem created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Problem.any_instance.should_receive(:update).with({ "text" => "MyString" })
        put :update, {:id => problem.to_param, :problem => { "text" => "MyString" }}, valid_session
      end

      it "assigns the requested problem as @problem" do
        problem = Problem.create! valid_attributes
        put :update, {:id => problem.to_param, :problem => valid_attributes}, valid_session
        assigns(:problem).should eq(problem)
      end

      it "redirects to the problem" do
        problem = Problem.create! valid_attributes
        put :update, {:id => problem.to_param, :problem => valid_attributes}, valid_session
        response.should redirect_to(problem)
      end
    end

    describe "with invalid params" do
      it "assigns the problem as @problem" do
        problem = Problem.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Problem.any_instance.stub(:save).and_return(false)
        put :update, {:id => problem.to_param, :problem => { "text" => "invalid value" }}, valid_session
        assigns(:problem).should eq(problem)
      end

      it "re-renders the 'edit' template" do
        problem = Problem.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Problem.any_instance.stub(:save).and_return(false)
        put :update, {:id => problem.to_param, :problem => { "text" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested problem" do
      problem = Problem.create! valid_attributes
      expect {
        delete :destroy, {:id => problem.to_param}, valid_session
      }.to change(Problem, :count).by(-1)
    end

    it "redirects to the problems list" do
      problem = Problem.create! valid_attributes
      delete :destroy, {:id => problem.to_param}, valid_session
      response.should redirect_to(problems_url)
    end
  end

end
