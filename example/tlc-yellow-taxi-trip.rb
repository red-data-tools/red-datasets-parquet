#!/usr/bin/env ruby

require "datasets-parquet"

trips = Datasets::TLC::YellowTaxiTrip.new(year: 2022, month: 1)

p trips.to_arrow
# #<Arrow::Table:0x128949110 ptr=0x102c10b60>
# VendorID             tpep_pickup_datetime           tpep_dropoff_datetime       passenger_count trip_distance   RatecodeID      store_and_fwd_flag      PULocationID    DOLocationID       payment_type    fare_amount          extra         mta_tax      tip_amount      tolls_amount    improvement_surcharge   total_amount    congestion_surcharge    airport_fee
# 0        1        2022-01-01T09:35:40+09:00       2022-01-01T09:53:29+09:00              2.000000      3.800000     1.000000      N                                142             236                  1      14.500000       3.000000        0.500000        3.650000          0.000000                 0.300000      21.950000                2.500000       0.000000
# 1        1        2022-01-01T09:33:43+09:00       2022-01-01T09:42:07+09:00              1.000000      2.100000     1.000000      N                                236              42                  1       8.000000       0.500000        0.500000        4.000000          0.000000                 0.300000      13.300000                0.000000       0.000000
# ...

trips.each do |trip|
  p [
      trip.vendor,
      trip.tpep_pickup_datetime,
      trip.tpep_dropoff_datetime,
      trip.passenger_count,
      trip.trip_distance,
      trip.rate_code,
      trip.store_and_fwd?,
      trip.pu_location_id,
      trip.do_location_id,
      trip.payment,
      trip.fare_amount,
      trip.extra,
      trip.mta_tax,
      trip.tip_amount,
      trip.tolls_amount,
      trip.improvement_surcharge,
      trip.total_amount,
      trip.congestion_surcharge,
      trip.airport_fee
  ]
  # [:creative_mobile_technologies, 2022-01-01 09:35:40 +0900, 2022-01-01 09:53:29 +0900, 2.0, 3.8, :standard_rate, false, 142, 236, :credit_card, 14.5, 3.0, 0.5, 3.65, 0.0, 0.3, 21.95, 2.5, 0.0]
  # [:creative_mobile_technologies, 2022-01-01 09:33:43 +0900, 2022-01-01 09:42:07 +0900, 1.0, 2.1, :standard_rate, false, 236, 42, :credit_card, 8.0, 0.5, 0.5, 4.0, 0.0, 0.3, 13.3, 0.0, 0.0]
end
