class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_staff!

  # GET /items
  # GET /items.json
  def index
    @project = Project.find(params[:project_id])
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @project = Project.find(params[:project_id])
  end

  # GET /items/new
  def new
    @project = Project.find(params[:project_id])
    @item = @project.items.build
    @path = project_items_path(@project, @item)
    @method = :post
  end

  # GET /items/1/edit
  def edit
    @project = Project.find(params[:project_id])
    @path = project_item_path(@project, @item)
    @method = :patch
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to project_item_path(:id => @item.id, :project_id => params[:project_id]), notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to project_item_path(:id => @item.id, :project_id => params[:project_id]), notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    # Delete all records within item
    @item.records.each do |record|
      record.destroy
    end

    @item.destroy
    respond_to do |format|
      format.html { redirect_to project_items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit!
    end

    def project_params
      params.require(:project).permit!
    end
end
