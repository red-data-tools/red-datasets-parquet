#!/usr/bin/env ruby

require "datasets-parquet"

trips = Datasets::TLC::HighVolumeFHVTrip.new(year: 2022, month: 1)

p trips.to_arrow
#<Arrow::Table:0x13f920640 ptr=0x13f180160>
# hvfhs_license_num       dispatching_base_num    originating_base_num             request_datetime               on_scene_datetime                 pickup_datetime            dropoff_datetime       PULocationID    DOLocationID    trip_miles      trip_time       base_passenger_fare          tolls             bcf   sales_tax      congestion_surcharge    airport_fee           tips      driver_pay      shared_request_flag     shared_match_flag       access_a_ride_flag  wav_request_flag        wav_match_flag
# 0        HV0003                  B03404                  B03404                  2022-01-01T09:05:31+09:00       2022-01-01T09:05:40+09:00       2022-01-01T09:07:24+09:00   2022-01-01T09:18:28+09:00                170             161      1.180000            664                 24.900000       0.000000   0.750000         2.210000                  2.750000       0.000000       0.000000       23.030000      N                       N                                           N                       N
# 1        HV0003                  B03404                  B03404                  2022-01-01T09:19:27+09:00       2022-01-01T09:22:08+09:00       2022-01-01T09:22:32+09:00   2022-01-01T09:30:12+09:00                237             161      0.820000            460                 11.970000       0.000000   0.360000         1.060000                  2.750000       0.000000       0.000000       12.320000      N                       N                                           N                       N
# ...


trips.each do |trip|
  p [
      trip.hvfhs_license_num,
      trip.dispatching_base_num,
      trip.originating_base_num,
      trip.request_datetime,
      trip.on_scene_datetime,
      trip.pickup_datetime,
      trip.dropoff_datetime,
      trip.pu_locationID,
      trip.do_locationID,
      trip.trip_miles,
      trip.trip_time,
      trip.base_passenger_fare,
      trip.tolls,
      trip.bcf,
      trip.sales_tax,
      trip.congestion_surcharge,
      trip.airport_fee,
      trip.tips,
      trip.driver_pay,
      trip.shared_request_flag?,
      trip.shared_match_flag?,
      trip.access_a_ride_flag?,
      trip.wav_request_flag?,
      trip.wav_match_flag?,
    ]
end
# [:uber, "B03404", "B03404", 2022-01-01 09:05:31 +0900, 2022-01-01 09:05:40 +0900, 2022-01-01 09:07:24 +0900, 2022-01-01 09:18:28 +0900, 170, 161, 1.18, 664, 24.9, 0.0, 0.75, 2.21, 2.75, 0.0, 0.0, 23.03, false, false, false, false, false]
# [:uber, "B03404", "B03404", 2022-01-01 09:19:27 +0900, 2022-01-01 09:22:08 +0900, 2022-01-01 09:22:32 +0900, 2022-01-01 09:30:12 +0900, 237, 161, 0.82, 460, 11.97, 0.0, 0.36, 1.06, 2.75, 0.0, 0.0, 12.32, false, false, false, false, false]
# [:uber, "B03404", "B03404", 2022-01-01 09:43:53 +0900, 2022-01-01 09:57:37 +0900, 2022-01-01 09:57:37 +0900, 2022-01-01 10:07:32 +0900, 237, 161, 1.18, 595, 29.82, 0.0, 0.89, 2.65, 2.75, 0.0, 0.0, 23.3, false, false, false, false, false]
# ...
