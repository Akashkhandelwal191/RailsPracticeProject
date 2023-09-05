ActiveAdmin.register Address do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :address_type, :city, :country, :state, :area, :postal_code, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:address_type, :city, :country, :state, :area, :postal_code, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  

  form do |f|
     f.inputs do 
       f.input :user_id, :as => :select, :collection => User.all.collect {|user| [user.username, user.id] }
       f.input :country, as: :select, collection: country_dropdown
       f.input :address_type
       f.input :state
       f.input :city
       f.input :area
       f.input :postal_code

     end
    f.actions
  end

end
