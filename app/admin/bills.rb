ActiveAdmin.register Bill do
  menu :parent => "Order",
       :priority => 2

  show do |bill|
    attributes_table do
      row :number
      row :payer
      row :total_price
    end
    render 'public_consumes'
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :payer
      f.input :number
      f.input :total_price
      f.input :partners, :as => :select,  :collection => User.all
    end
    f.actions
  end

end
