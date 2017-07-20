class AddPresenterToPresentation < ActiveRecord::Migration[5.1]
  def change
  	add_column :presentations, :presenter, :string,null: false, default: '000000'
  end
end
