class CreateIntakeProfiles < ActiveRecord::Migration[5.0]
    def change
      create_table :intake_profiles do |t|
        t.string :first_name
        t.string :last_name
        t.string :phone
        t.string :email
        t.boolean :waiver_signed
        t.boolean :waiver_processed
        t.boolean :bio_submitted
        t.boolean :picture_submitted
        t.boolean :profile_done
  
        t.timestamps
      end
    end
  end
  