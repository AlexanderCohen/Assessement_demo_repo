class SubjectsController < ApplicationController
  before_action :authenticate_teacher!

  def index
    @subjects = Subject.all
    @skills = Skill.all
    @achievement = Achievement.all
  end

  def new
    @subjects = Subject.new
  end

  def show
    @subject = Subject.find(params[:id])
    @skills = @subject.skills
    @proficiency_level = ProficiencyLevel.all
    @level_range = @proficiency_level.each_with_object([]) do |proficiency_level, arr|
      arr << [proficiency_level.level]
    end
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      redirect_to subjects_path
    else
      redirect_to root_path
    end
  end

  private

  def subject_params
    params.require(:subject).permit(:name)
  end

  def set_subject
    @subjects = Subject.find(params[:id])
  end

end
