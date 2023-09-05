ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at,:user_avatar,:first_name,:last_name,:gender,:mobile_number,:username
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    id_column
    column :email
    column :username
    column :first_name
    column :last_name
    column :gender
    column :mobile_number
    actions
  end


  show do
   attributes_table do
     if resource.user_avatar.present?
       row "Images" do |p|
         image_tag p.user_avatar,class:'my_img_size' 
       end
     end
      row :email
      row :username
      row :first_name
      row :last_name
      row :gender
      row :mobile_number
    end
    active_admin_comments
  end

  
end
