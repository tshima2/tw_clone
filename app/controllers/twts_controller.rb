class TwtsController < ApplicationController

  before_action :_set_twt_with_id, only: [:edit, :update, :destroy]  
  def destroy
    @twt.destroy
    redirect_to twts_path, notice:"ブログを削除しました！"
  end
  
  def edit
  end

  def update
    if @twt.update(_twt_params)
      redirect_to twts_path, notice: "ツイートを編集しました!"
    else
      render :edit
    end
  end

  def index
    @twts = Twt.all.order(:id)
  end

  def new
    @twt = Twt.new
  end

  def confirm
    @twt=Twt.new(_twt_params)
    render :new if @twt.invalid?
  end


  def create
    @twt = Twt.new(_twt_params)
    if params[:back]
      render :new
    else
      if @twt.save
        redirect_to new_twt_path, notice: 'ツイートを保存しました!'
      else
        notice='保存に失敗しました'
        render :new
      end
    end
  end

  private
  def _twt_params
    params.require(:twt).permit(:content)
  end

  def _set_twt_with_id
    @twt=Twt.find(params[:id])
  end
end
