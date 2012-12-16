ActiveAdmin.register PartnerPublicConsume do
  menu :parent => "Order"

  actions :index, :show, :new, :create, :destroy

  index do
    column :user
    column :bill
    column :consume
    column :counted
    default_actions
  end

  form do |f|
    f.inputs "User & Order" do
      f.input :user
      f.input :bill
    end
    f.actions
  end
end
