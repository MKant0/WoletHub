class CreateWebhookEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :webhook_events do |t|
      t.string :fintoc_event_id

      t.timestamps
    end
  end
end
