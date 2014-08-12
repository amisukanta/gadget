class GadgetsController < ApplicationController
  
before_action :authenticate_user!
  before_action :set_gadget, only: [:show, :edit, :update, :destroy]

  def index
    @gadgets = Gadget.all
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
    else
      flash[:notice] = "Cant create your gadgets"
    end
  end

  def update
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
