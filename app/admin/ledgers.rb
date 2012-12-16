ActiveAdmin.register Ledger do
  menu :parent => "Ledger", :priority => 2

  show do |bill|
    attributes_table do
      row :end_date
      row :total_price
    end
    render 'ledger_items'
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :end_date
    end
    f.actions
  end

end

