class FiltersController < ApplicationController
    def index
        if params[:search]
            redirect_to ("/posts?search[word]=#{params[:search]}")
        else
            redirect_to ("/filters/search")
        end
    end

    def search
        if params[:search]
            redirect_to ("/posts?search[word]=#{params[:search]}")
        else
            # empty search
        end
    end

end
