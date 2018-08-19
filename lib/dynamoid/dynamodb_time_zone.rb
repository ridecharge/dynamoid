# frozen_string_literal: true

module Dynamoid
  module DynamodbTimeZone
    def self.in_time_zone(value)
      time_zone = case Dynamoid::Config.dynamodb_timezone
                    when :utc then 'UTC'
                    when :local then ActiveSupport::TimeZone[Time.now.utc_offset].name
                    else Dynamoid::Config.dynamodb_timezone
                  end
      value.in_time_zone(time_zone).to_datetime
    end
  end
end
