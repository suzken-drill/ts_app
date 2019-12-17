class ItemsController < ApplicationController
  before_action :authenticate_admin!
  rescue_from ActiveRecord::RecordNotFound do |exception|
    redirect_to items_path, flash: {error: I18n.t(:item_not_exist_error, scope: :message)}
  end
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.page(params[:page]).per(Item::PER)
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item), flash: { notice: I18n.t(:create_finish_message, scope: :message) }
    else
      render action: :new, flash: { error: I18n.t(:create_error_message, scope: :message) }
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item), flash: { notice: I18n.t(:update_finish_message, scope: :message) }
    else
      render action: :edit, flash: { error: I18n.t(:update_error_message, scope: :message) }
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path, flash: { notice: I18n.t(:destroy_finish_message, scope: :message) }
  end

  def file_upload
    
  end

  def file_read
    
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end
    def item_params
      params.require(:item).permit(Item::REGISTRABLE_ATTRIBUTES)
    end
end
