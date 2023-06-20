class SpicesController < ApplicationController
     # Return an array of all spices
     def index
       spices = Spice.all
       render json: spices
     end
   
     # Create a new spice
     def create
       spice = Spice.create(spice_params)
       render json: spice, status: :created
     end

     # delete a spice
     def destroy
          spice = Spice.find_by(id: params[:id])
          if spice
               spice.destroy
               render json: {success: "Deleted succesfully"}
          else
               render json: { error: 'Spice not found' }
          end
     end

     # update an existing spice
     def update
          spice = Spice.find_by(id: params[:id])
          if spice
            if spice.update(spice_params)
              render json:  spice 
            else
              render json: { error: 'Failed to update spice' }, status: :unprocessable_entity
            end
          else
            render json: { error: 'Spice not found' }, status: :not_found
          end
     end

     # Strong parameters for updating a spice
     def patch_params
          params.permit(:id)
     end

     # Strong parameters for creating a spice
     def spice_params
       params.permit(:title, :image, :description, :notes, :rating)
     end
   end
   