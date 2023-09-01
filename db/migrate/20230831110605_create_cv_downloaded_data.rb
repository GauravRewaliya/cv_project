class CreateCvDownloadedData < ActiveRecord::Migration[7.0]
  def change
    create_table :cv_downloaded_data do |t|
      # t.references :curriculum_vitae, null: false, foreign_key: true
      t.references :cv, null: false, foreign_key: { to_table: :curriculum_vitaes }
      t.boolean :pdf_downloaded
      t.boolean :doc_downloaded

      t.timestamps
    end
  end
end
