class TwtsController < ApplicationController
  def create
    @twt = Twt.new(_twt_params)
    if params[:back]
      render :new
    else
      if @twt.save
        redirect_to new_twt_path, notice: '正常に保存しました'
      else
        notice='保存に失敗しました'
        render :new
      end
    end
  end

  def new
    @twt = Twt.new
  end

  def confirm
    @twt=Twt.new(_twt_params)
    render :new if @twt.invalid?
  end

  private
  def _twt_params
    params.require(:twt).permit(:content)
  end
end
