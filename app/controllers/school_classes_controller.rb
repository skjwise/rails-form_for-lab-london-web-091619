class SchoolClassesController < ApplicationController

    def index 
        @schoolclasses = SchoolClass.all
    end

    def show 
        @schoolclass = SchoolClass.find(params[:id])
    end

    def new
        @schoolclass = SchoolClass.new
        render :form
    end

    def create
        @schoolclass = SchoolClass.create(schoolclass_params(:title, :room_number))
        redirect_to school_class_path(@schoolclass)
    end 

    def edit
        @schoolclass = SchoolClass.find(params[:id])
        render :form
    end

    def update
        @schoolclass = SchoolClass.find(params[:id])
        @schoolclass.update(schoolclass_params(:title, :room_number))
        redirect_to school_class_path(@schoolclass)
    end

    private

    def schoolclass_params(*args)
        params.require(:school_class).permit(*args)
    end

end