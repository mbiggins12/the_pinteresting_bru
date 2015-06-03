class AddBoardToPin < ActiveRecord::Migration
  def change
    add_column :pins, :board, :string
  end
end
