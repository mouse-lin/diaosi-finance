ActiveAdmin.register User  do
  menu :parent => "Accounts"

  index do
    column :name
    column :email
    default_actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end

    f.buttons
  end
end
