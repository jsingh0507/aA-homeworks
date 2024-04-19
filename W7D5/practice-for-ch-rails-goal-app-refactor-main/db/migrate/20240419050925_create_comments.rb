class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :commentable, polymorphic: true, index: { name: 'index_comments_on_commentable' }, null: false

      t.timestamps
    end
  end
end
