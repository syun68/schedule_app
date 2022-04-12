class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def sort_by_date
    @schedules = Schedule.all.order(start: "ASC")
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title,:start,:end,:allday,:content))
    if @schedule.save
      flash[:notice] = "スケジュールを登録しました"
      redirect_to :schedules
    else
      render "new", status: :unprocessable_entity
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  # def update
  #   @schedule = Schedule.find(params[:id])
  #   @schedule.update(params.require(:schedule).permit(:title,:start,:end,:allday,:content))
  #   if @schedule.end.before? start
  #     flash[:notice] = "終了日が開始日よりも早いです"
  #   elsif @schedule.save
  #     flash[:notice] = "スケジュールを更新しました"
  #     redirect_to :schedules
  #   else
  #     render "edit", status: :unprocessable_entity
  #   end
  # end

  def update
    @schedule = Schedule.find(params[:id])
    @schedule.update(params.require(:schedule).permit(:title,:start,:end,:allday,:content))
    if @schedule.save
      flash[:notice] = "スケジュールを更新しました"
      redirect_to :schedules
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
      flash[:notice] = "削除しました"
      redirect_to :schedules
  end
end
