class SkillsController < ApplicationController

  def show
      @skill = Skill.find(params[:id])
      @subject = @skill.subject
      @proficiency_level = ProficiencyLevel.where(skill_id: @skill.id)
  end

  def index
      @subject = Subject.all
      @skill = Skill.all

  end

  def new
    @skill = Skill.new
    @subject = Subject.find(params[:subject_id])
  end

  def edit
    @skill = Skill.find(params[:id])
  end

  def update
    @skill = Skill.find(params[:id])
    if @skill.update(skills_params)
      redirect_to skill_path(@skill)
    else

    end
  end

  def create
    @skill = Skill.new(skills_params)
    @subject = @skill.subject
    if @skill.save
      redirect_to subject_path(@subject)
    else
      render 'index'
    end
  end

  def destroy
    @skill = Skill.find(params[:id])
    if @skill.destroy
      respond_to do |format|
      format.html { redirect_to subjects_path, notice: 'The Skill was was successfully destroyed.' }
      format.json { head :no_content }
      render 'show'
      end
    else
    end
  end

  def level_up_proficiency
    level_up_proficiency!
  end

  private

  def skills_params
    params.require(:skill).permit(:name, :subject_id, :id, :color)
  end
end
