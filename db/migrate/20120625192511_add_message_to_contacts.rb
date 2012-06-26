class AddMessageToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :message, :string
  end
end
