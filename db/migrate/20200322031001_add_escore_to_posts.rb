class AddEscoreToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :escore, :integer, default: 0
  end
end
