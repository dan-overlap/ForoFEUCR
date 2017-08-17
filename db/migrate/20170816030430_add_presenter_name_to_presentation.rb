class AddPresenterNameToPresentation < ActiveRecord::Migration[5.1]
  def change
  	add_column :presentations, :presenter_name, :string
  end
end
