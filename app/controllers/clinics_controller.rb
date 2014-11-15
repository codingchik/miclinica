class ClinicsController < ApplicationController


def index
  respond_with Clinic.all
end

def create
  respond_with Clinic.create(clinic_params)
end

def show
  respond_with Clinic.find(params[:id])
end

def upvote
  clinic = Clinic.find(params[:id])
  clinic.increment!(:upvotes)

  respond_with clinic
end

private

def clinic_params
  params.require(:clinic).permit(:title, :category, :street, :city, :zip, :areaserved, :openhours, :phone, :languages, :payscale)
end


end
