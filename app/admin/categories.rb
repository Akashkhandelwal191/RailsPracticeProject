ActiveAdmin.register Category do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
    permit_params :category_name,:category_image
  #
  # or
  #
  # permit_params do
  #   permitted = [:category_name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    
      f.inputs do
          f.input :category_name
          f.input :category_image,as: :file 
    
      end
  
    f.actions
  end
  

  show do
   attributes_table do
     if resource.category_image.present?
       row "Images" do |p|
         image_tag p.category_image,class:'categoryimgcss' 
       end
     end
      row :category_name
    end
    active_admin_comments
  end

end
