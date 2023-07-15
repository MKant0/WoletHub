class AddFieldsToWebhookEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :webhook_events, :type, :string
    add_column :webhook_events, :data, :string
  end
end
