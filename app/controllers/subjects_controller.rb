class SubjectsController < ApplicationController
  def index
    @subjects = Subject.paginate page: params[:page]
  end

  def new
    @subject = Subject.new
    @subject.tasks.build
  end

  def show
    @subject = Subject.find params[:id]
  end

  def destroy
    @subject = Subject.find params[:id]
    @subject.destroy
    flash[:success] = "Deleted"
    redirect_to subjects_url
  end

  def edit
    @subject = Subject.find params[:id]
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:success] = "Added new subject"
      redirect_to @subject
    else
      flash[:danger] = "Fail!"
      render :new
    end
  end

  def update
    @subject = Subject.find params[:id]
    if @subject.update_attributes(subject_params)
      flash[:success] = "Done!"
      redirect_to @subject
    else
      flash[:danger] = "Fail!"
      render :edit  
    end
  end

  private
  def subject_params
    params.require(:subject).permit(:name, :content, tasks_attributes: [:name])
  end  
end