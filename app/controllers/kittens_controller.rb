class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.html
      format.json { render json: @kittens }
    end
  end

  def show
    @kitten = Kitten.find(params[:id])
    @next_kitten = Kitten.where("id > ?", @kitten.id).order(:id).first
    @previous_kitten = Kitten.where("id < ?", @kitten.id).order(:id).last
    respond_to do |format|
      format.html
      format.json { render json: @kittens }
    end  end

  def new
    @kitten = Kitten.new
    respond_to do |format|
      format.html
      format.json { render json: @kittens }
    end
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      flash[:success] = "Kitten was successfully created!"
      format.html { redirect_to @kitten, notice: "Kitten was successfully created!" }
      format.json { render json: @kitten, status: :created, location: @kitten }
    else
      flash[:error] = "Failed to create kitten."
      format.html { render :new }
      format.json { render json: @kitten.errors, status: :unprocessable_entity }
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @kitten }
    end
  end

  def update
    @kitten = Kitten.find(params[:id])

    if @kitten.update(kitten_params)
      flash[:success] = "Kitten was successfully updated!"
      format.html { redirect_to @kitten, notice: "Kitten was successfully updated!" }
      format.json { render json: @kitten, status: :created, location: @kitten }
    else
      flash[:error] = "Failed to update kitten."
      format.html { render :edit }
      format.json { render json: @kitten.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
