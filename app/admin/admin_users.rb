ActiveAdmin.register AdminUser do
  index do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end
  
  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :email
      f.input :password
    end
  end

end
