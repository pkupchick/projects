class CatsController < ApplicationController 
    def index 
        @cats = Cat.all
        render :index 
    end 

    def show 
        @cats = Cat.find_by_id(params[:id])
        render :show 
    end 

    def new
        @cats = Cat.new
        render :new
    end

    def create 
        @cats = Cat.new(cat_params)
            if @cats.save 
                redirect_to cat_url(@cats)
            else 
                render json: @cats.errors.full_messages, status: 422
            end 
    end 

    def edit
        @cats = Cat.find_by_id(params[:id])
        render :edit
    end

    def update
        @cats = Cat.find_by_id(params[:id])
        if @cats.update(cat_params)
            redirect_to cat_url(@cat)
        else
            render json: @cat.error_full_messages, status: 422
        end
    end

private

    def cat_params
        params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
    end

end 