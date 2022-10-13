#!/usr/bin/env ruby

require "datasets-parquet"

trips = DatasetsParquet::TLC::GreenTaxiTrip.new(year: 2022, month: 1)

p trips.to_arrow
# #<Arrow::Table:0x1474998d0 ptr=0x136e79d60>
# VendorID             lpep_pickup_datetime           lpep_dropoff_datetime       store_and_fwd_flag      RatecodeID      PULocationID    DOLocationID    passenger_count trip_distance      fare_amount          extra         mta_tax      tip_amount      tolls_amount    ehail_fee       improvement_surcharge   total_amount    payment_type     trip_typecongestion_surcharge
# 0          2        2022-01-01T09:14:21+09:00       2022-01-01T09:15:33+09:00       N                         1.000000                42              42           1.000000      0.440000         3.500000       0.500000        0.500000        0.000000          0.000000       (null)                    0.300000       4.800000        2.000000      1.000000            0.000000
# 1          1        2022-01-01T09:20:55+09:00       2022-01-01T09:29:38+09:00       N                         1.000000               116              41           1.000000      2.100000         9.500000       0.500000        0.500000        0.000000          0.000000       (null)                    0.300000      10.800000        2.000000      1.000000            0.000000
# ...

trips.each do |trip|
  p [
      trip.vendor,
      trip.lpep_pickup_datetime,
      trip.lpep_dropoff_datetime,
      trip.store_and_fwd?,
      trip.rate_code,
      trip.pu_location_id,
      trip.do_location_id,
      trip.passenger_count,
      trip.trip_distance,
      trip.fare_amount,
      trip.extra,
      trip.mta_tax,
      trip.tip_amount,
      trip.tolls_amount,
      trip.ehail_fee,
      trip.improvement_surcharge,
      trip.total_amount,
      trip.payment,
      trip.trip,
      trip.congestion_surcharge,
  ]
  # [:veri_fone_inc, 2022-01-01 09:14:21 +0900, 2022-01-01 09:15:33 +0900, false, :standard_rate, 42, 42, 1.0, 0.44, 3.5, 0.5, 0.5, 0.0, 0.0, nil, 0.3, 4.8, :cash, :street_hail, 0.0]
  # [:creative_mobile_technologies, 2022-01-01 09:20:55 +0900, 2022-01-01 09:29:38 +0900, false, :standard_rate, 116, 41, 1.0, 2.1, 9.5, 0.5, 0.5, 0.0, 0.0, nil, 0.3, 10.8, :cash, :street_hail, 0.0]
end
