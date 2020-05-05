class VerbalMarksController < ApplicationController
  before_action :set_verbal_mark, only: [:show, :edit, :update, :destroy]

  # GET /verbal_marks
  # GET /verbal_marks.json
  def index
    @verbal_marks = VerbalMark.all
  end

  # GET /verbal_marks/1
  # GET /verbal_marks/1.json
  def show
  end

  # GET /verbal_marks/new
  def new
    @verbal_mark = VerbalMark.new
  end

  # GET /verbal_marks/1/edit
  def edit
  end

  # POST /verbal_marks
  # POST /verbal_marks.json
  def create
    @verbal_mark = VerbalMark.new(verbal_mark_params)

    respond_to do |format|
      if @verbal_mark.save
        format.html { redirect_to @verbal_mark, notice: 'Verbal mark was successfully created.' }
        format.json { render :show, status: :created, location: @verbal_mark }
      else
        format.html { render :new }
        format.json { render json: @verbal_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /verbal_marks/1
  # PATCH/PUT /verbal_marks/1.json
  def update
    respond_to do |format|
      if @verbal_mark.update(verbal_mark_params)
        format.html { redirect_to @verbal_mark, notice: 'Verbal mark was successfully updated.' }
        format.json { render :show, status: :ok, location: @verbal_mark }
      else
        format.html { render :edit }
        format.json { render json: @verbal_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /verbal_marks/1
  # DELETE /verbal_marks/1.json
  def destroy
    @verbal_mark.destroy
    respond_to do |format|
      format.html { redirect_to verbal_marks_url, notice: 'Verbal mark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_verbal_mark
      @verbal_mark = VerbalMark.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def verbal_mark_params
      params.require(:verbal_mark).permit(:user_id, :post_id, :comment_id, :verbal_mark)
    end
end
