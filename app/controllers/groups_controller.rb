class GroupsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_group, only: %i[ show edit update destroy ]

  
  def index
    if params['token'] == "manojgardi"
      @groups = Group.all
      # render json: @groups, status: 200
      render :status => 200, :json => {:status => "Success", "data" => @groups}
    else
      render :status => 200, :json => {:status=>"Failure", :message=>"Invalid token."}
    end
  end

  def show
    render json: @group
  end

  def new
    @group = Group.new
  end

  def edit
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      render :status => 200, :json => {:status => "Success", "data" => @groups}
    else
      render :status => 200, :json => {:status=>"Failure", :message=>"Invalid token.", }
      format.json { render json: @group.errors, status: :unprocessable_entity }
    end
  end

  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to group_url(@group), notice: "Group was successfully updated." }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url, notice: "Group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name)
    end
end
