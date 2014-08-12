class CreateGadgetAttachments < ActiveRecord::Migration
  def change
    create_table :gadget_attachments do |t|
      t.integer :gadget_id
      t.string :avatar

      t.timestamps
    end
  end
end
