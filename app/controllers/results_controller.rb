class ResultsController < ApplicationController
  before_action :set_result, only: [:create, :show, :edit, :update, :destroy]
  before_action :set_answer, only: [:new, :create, :edit, :update]
  before_action :set_city, only: [:new, :create, :edit, :update]

  # GET /results
  # GET /results.json
  def index
    @results = Result.all
  end

  # GET /results/1
  # GET /results/1.json
  def show
  end

  # GET /results/new
  def new
    @result = Result.new(answer: @answer)
  end

  # GET /results/1/edit
  def edit
  end

  # POST /results
  # POST /results.json
  def create
    respond_to do |format|
      if @result.save
        format.html { redirect_to answers_url(problem_id: @result.answer.problem), notice: 'Result was successfully created.' }
      else
        format.html { render action: 'new' }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /results/1
  # PATCH/PUT /results/1.json
  def update
    respond_to do |format|
      if @result.update(result_params)
        format.html { redirect_to answers_url(problem_id: @result.answer.problem), notice: 'Result was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result ||= if params[:id].present?
        Result.find(params[:id])
      elsif params[:result].present?
        Result.new(result_params)
      end
    end

    def set_answer
      id = params[:answer_id] || @result.try(:answer_id) || set_result.answer_id
      @answer ||= Answer.find(id)
    end

    def set_city
      @city = ResultsCalculator.new @answer.city
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def result_params
      params.require(:result).permit(:answer_id, :characteristics, :delta_pollution, :delta_public_support, :delta_corporate_support, :delta_balance, :text, :valid_answer)
    end
end
