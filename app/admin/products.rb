ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :product_name, :product_description, :product_price, :product_quantity, :category_id, :wish_list_id,:product_images => []
  #
  # or
  #
  # permit_params do
  #   permitted = [:product_name, :product_description, :product_price, :product_quantity, :category_id, :wish_list_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  show do
     attributes_table do
      if resource.product_images.present?
        row "Images(#{resource.product_images.count})" do 
          div do
            resource.product_images.each do |img|
               span do
                 image_tag url_for(img),size:"200x200"
               end
            end
          end 
        end
      end
      row :product_name
      row :product_description
      row :product_price
      row :product_quantity
      row "category_name" do |p|
         p.category.category_name
      end
     end
    active_admin_comments
  end
  


  form do |f|
    
      f.inputs do
          f.input :category_id, :as => :select, :collection => Category.all.collect {|category| [category.category_name, category.id] }
          f.input :product_images,as: :file,input_html: { multiple: true } 
          f.input :product_name
          f.input :product_description
          f.input :product_price
          f.input :product_quantity

      end
  
    f.actions
  end
  

  # controller do
  #   def update
  #     debugger
  #   end
  # end
  
end
