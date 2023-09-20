class AddressesController < ApplicationController
  before_action :authenticate_user! 

  def index
  end
   
  def new
  end
 
  def create
    @address = current_user.addresses.build(address_params)

    if @address.save
      redirect_to '/homes/show', notice: 'Address was successfully created.',allow_other_host: true
    else
      render :new, notice:"All Fields Are Mandatory!!"
    end
  end

  def show
  end

  def destroy
    @address = Address.find_by_id(params[:id])
    @address.destroy

    redirect_to '/homes/show', notice: 'Address was successfully removed.'
  end

  private

  def address_params
    params.require(:address).permit(:city,:state,:country,:area,:address_type,:postal_code)
  end
end
