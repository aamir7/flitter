class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table    :microposts do |t|
      t.text        :content
      t.references  :user, index: true

      t.timestamps
    end
  end
end
