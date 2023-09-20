class ListsController < ApplicationController
  
  def new
    @list = List.new
  end
  
  def create
    list = List.new(list_params)
    if list.save
      redirect_to list_path(list.id), notice: '保存に成功しました'
    else
      flash.now[alert] = "保存に失敗しました"
      render :new
    end
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])  
  end
  
  def update
    list = List.find(params[:id])
    if list.update(list_params)
      redirect_to list_path(list.id), notice: '更新に成功しました'
    else
      flash.now[alert] = '更新に失敗しました'
      render :edit
    end
  end
  
  private
  
  def list_params
    params.require(:list).permit(:title, :body)  
  end
end
