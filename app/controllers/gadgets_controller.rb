class GadgetsController < ApplicationController
  
before_action :authenticate_user!
  before_action :set_gadget, only: [:show, :edit, :update, :destroy]

  def index
   # if params[:search]
  #   @gadgets = Gadget.search(params[:search]).order("created_at DESC")
  # else
    @gadgets = Gadget.all
  #end
  end
  def search_result
    if params[:search]
       @mygadgets = Gadget.search(params[:search]).order("created_at DESC")
    
    else
      flash[:notice] = "Nothing found. Do a search again"
    end
  end
  
  def original
    @gadget_attachments = @gadget.gadget_attachments.find(params[:id])
  end
  
  def show
     @gadget_attachments = @gadget.gadget_attachments.all
  end

  def new
    @gadget = Gadget.new

    @gadget_attachment = @gadget.gadget_attachments.build
  end

  def edit
  end

  def create
    @gadget = Gadget.new(gadget_params)
    if @gadget.save

        params[:gadget_attachments]['avatar'].each do |a|
           @gadget_attachment = @gadget.gadget_attachments.create!(:avatar => a, :gadget_id => @gadget.id)
      end
      flash[:notice] = "Successfully saved your gadget data"
    else
      flash[:notice] = "Cant create your gadgets"
      render 'new'
    end
  end

  def update
     if @gadget.update(gadget_params)
      flash[:notice] = "Successfully updated"
    else
      render 'edit'
    end
    redirect_to @gadget
     
  end


  private
   
    def set_gadget
      @gadget = Gadget.find(params[:id])
    end

   
    def gadget_params

      params.require(:gadget).permit(:name, :description, :price, gadget_attachments_attributes: [:id, :gadget_id, :avatar])

      params.require(:gadget).permit(:name, :description, :image, :price)

    end

end
