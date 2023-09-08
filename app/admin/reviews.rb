ActiveAdmin.register Review do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :description, :rating, :user_id, :product_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:description, :rating, :user_id, :product_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    
      f.inputs do
          f.input :user_id, :as => :select, :collection => User.all.collect {|u| [u.first_name, u.id] }
          f.input :product_id, :as => :select, :collection => Product.all.collect {|p| [p.product_name, p.id] }
          f.input :description
          f.input :rating
      end
  
    f.actions
  end


end
