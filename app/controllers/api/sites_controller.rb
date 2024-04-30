class Api::SitesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        @sites = Site.all
        if @sites.any?
          render json: @sites
        else
          render json: { message: 'No sites found' }, status: :not_found
        end
    end

    def create
      site = Site.new(site_params)
      if site.save
        render json: site, status: :created
      else
        render json: site.errors, status: :unprocessable_entity
      end
    end

    private

    def site_params
      params.require(:site).permit(:name, :address, :city, :state, :zipcode, :email, :phone, :site_admin_id)
    end

end