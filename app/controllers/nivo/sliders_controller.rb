module Nivo
  class SlidersController < ApplicationController

    filter_access_to :all

    unloadable

    layout 'cms'

    def index
      @sliders = Slider.page(params[:search], params[:page]) 
    end

    def show
      @slider = Slider.find(params[:id])
    end

    def new
      @slider = Slider.new
    end

    def create
      @slider = Slider.new(params[:slider])
      if @slider.save
        flash[:notice] = "Successfully created slider."
        redirect_to @slider
      else
        render :action => 'new'
      end
    end

    def edit
      @slider = Slider.find(params[:id])
    end

    def update
      @slider = Slider.find(params[:id])
      if @slider.update_attributes(params[:slider])
        flash[:notice] = "Successfully updated slider."
        redirect_to @slider
      else
        render :action => 'edit'
      end
    end

    def destroy
      @slider = Slider.find(params[:id])
      @slider.destroy
      flash[:notice] = "Successfully destroyed slider."
      redirect_to sliders_url
    end

  end
end
