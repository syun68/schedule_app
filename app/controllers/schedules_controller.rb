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
    @schedule = Schedule.new(schedule_params)
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

  def update
    @schedule = Schedule.find(params[:id])
    @schedule.update(schedule_params)
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

  private

  def schedule_params
    params.require(:schedule).permit(:title,:start,:end,:allday,:content)
  end

end
