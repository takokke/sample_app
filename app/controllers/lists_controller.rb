class ListsController < ApplicationController
  def new
    @list = List.new
  end
  
  def create
    list = List.new(list_params)
    if list.save
      redirect_to '/top', notice: '保存に成功しました'
    else
      flash.now[alert] = "保存に失敗しました"
      render :new
    end
  end

  def index
    @lists = List.all
  end

  def show
  end

  def edit
  end
  
  private
  
  def list_params
    params.require(:list).permit(:title, :body)  
  end
end
