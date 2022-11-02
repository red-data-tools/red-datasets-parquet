#!/usr/bin/env ruby

require "datasets-parquet"

trips = Datasets::TLC::FHVTrip.new(year: 2022, month: 1)

p trips.to_arrow
#<Arrow::Table:0x11441f108 ptr=0x10775f960>
# dispatching_base_num              pickup_datetime                dropOff_datetime       PUlocationID    DOlocationIDSR_Flag Affiliated_base_number
# 0 B00009                  2022-01-01T09:31:00+09:00       2022-01-01T10:05:00+09:00             (null)          (null) (null) B00009
# 1 B00009                  2022-01-01T09:37:00+09:00       2022-01-01T10:05:00+09:00             (null)          (null) (null) B00009
# ...

trips.each do |trip|
  p [
      trip.dispatching_base_num,
      trip.pickup_datetime,
      trip.dropoff_datetime,
      trip.pu_location_id,
      trip.do_location_id,
      trip.sr_flag?,
      trip.affiliated_base_number
  ]
end
# ["B00009", 2022-01-01 09:31:00 +0900, 2022-01-01 10:05:00 +0900, nil, nil, false, "B00009"]
# ["B00009", 2022-01-01 09:37:00 +0900, 2022-01-01 10:05:00 +0900, nil, nil, false, "B00009"]
# ...
