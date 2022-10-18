class TLCYellowTaxiTripTest < Test::Unit::TestCase
  def setup
    @default_timezone_env = ENV['TZ']
    ENV['TZ'] = 'UTC'
    @dataset = Datasets::TLC::YellowTaxiTrip.new(year: 2022, month: 1)
  end

  def teardown
    ENV['TZ'] = @default_timezone_env
  end

  test("#to_arrow") do
    assert_equal(<<~TABLE, @dataset.to_arrow.to_s)
\tVendorID\t     tpep_pickup_datetime\t    tpep_dropoff_datetime\tpassenger_count\ttrip_distance\tRatecodeID\tstore_and_fwd_flag\tPULocationID\tDOLocationID\tpayment_type\tfare_amount\t     extra\t   mta_tax\ttip_amount\ttolls_amount\timprovement_surcharge\ttotal_amount\tcongestion_surcharge\tairport_fee
      0\t       1\t2022-01-01T00:35:40+00:00\t2022-01-01T00:53:29+00:00\t       2.000000\t     3.800000\t  1.000000\tN                 \t         142\t         236\t           1\t  14.500000\t  3.000000\t  0.500000\t  3.650000\t    0.000000\t             0.300000\t   21.950000\t            2.500000\t   0.000000
      1\t       1\t2022-01-01T00:33:43+00:00\t2022-01-01T00:42:07+00:00\t       1.000000\t     2.100000\t  1.000000\tN                 \t         236\t          42\t           1\t   8.000000\t  0.500000\t  0.500000\t  4.000000\t    0.000000\t             0.300000\t   13.300000\t            0.000000\t   0.000000
      2\t       2\t2022-01-01T00:53:21+00:00\t2022-01-01T01:02:19+00:00\t       1.000000\t     0.970000\t  1.000000\tN                 \t         166\t         166\t           1\t   7.500000\t  0.500000\t  0.500000\t  1.760000\t    0.000000\t             0.300000\t   10.560000\t            0.000000\t   0.000000
      3\t       2\t2022-01-01T00:25:21+00:00\t2022-01-01T00:35:23+00:00\t       1.000000\t     1.090000\t  1.000000\tN                 \t         114\t          68\t           2\t   8.000000\t  0.500000\t  0.500000\t  0.000000\t    0.000000\t             0.300000\t   11.800000\t            2.500000\t   0.000000
      4\t       2\t2022-01-01T00:36:48+00:00\t2022-01-01T01:14:20+00:00\t       1.000000\t     4.300000\t  1.000000\tN                 \t          68\t         163\t           1\t  23.500000\t  0.500000\t  0.500000\t  3.000000\t    0.000000\t             0.300000\t   30.300000\t            2.500000\t   0.000000
      5\t       1\t2022-01-01T00:40:15+00:00\t2022-01-01T01:09:48+00:00\t       1.000000\t    10.300000\t  1.000000\tN                 \t         138\t         161\t           1\t  33.000000\t  3.000000\t  0.500000\t 13.000000\t    6.550000\t             0.300000\t   56.350000\t            2.500000\t   0.000000
      6\t       2\t2022-01-01T00:20:50+00:00\t2022-01-01T00:34:58+00:00\t       1.000000\t     5.070000\t  1.000000\tN                 \t         233\t          87\t           1\t  17.000000\t  0.500000\t  0.500000\t  5.200000\t    0.000000\t             0.300000\t   26.000000\t            2.500000\t   0.000000
      7\t       2\t2022-01-01T00:13:04+00:00\t2022-01-01T00:22:45+00:00\t       1.000000\t     2.020000\t  1.000000\tN                 \t         238\t         152\t           2\t   9.000000\t  0.500000\t  0.500000\t  0.000000\t    0.000000\t             0.300000\t   12.800000\t            2.500000\t   0.000000
      8\t       2\t2022-01-01T00:30:02+00:00\t2022-01-01T00:44:49+00:00\t       1.000000\t     2.710000\t  1.000000\tN                 \t         166\t         236\t           1\t  12.000000\t  0.500000\t  0.500000\t  2.250000\t    0.000000\t             0.300000\t   18.050000\t            2.500000\t   0.000000
      9\t       2\t2022-01-01T00:48:52+00:00\t2022-01-01T00:53:28+00:00\t       1.000000\t     0.780000\t  1.000000\tN                 \t         236\t         141\t           2\t   5.000000\t  0.500000\t  0.500000\t  0.000000\t    0.000000\t             0.300000\t    8.800000\t            2.500000\t   0.000000
...
2463921\t       2\t2022-01-31T23:36:07+00:00\t2022-01-31T23:48:05+00:00\t         (null)\t     3.040000\t    (null)\t            (null)\t         158\t         261\t           0\t  13.090000\t  0.000000\t  0.500000\t  3.530000\t    0.000000\t             0.300000\t   19.920000\t              (null)\t     (null)
2463922\t       2\t2022-01-31T23:09:46+00:00\t2022-01-31T23:20:50+00:00\t         (null)\t     2.420000\t    (null)\t            (null)\t         233\t          79\t           0\t  10.970000\t  0.000000\t  0.500000\t  2.290000\t    0.000000\t             0.300000\t   16.560000\t              (null)\t     (null)
2463923\t       2\t2022-01-31T23:51:47+00:00\t2022-02-01T00:10:07+00:00\t         (null)\t     7.510000\t    (null)\t            (null)\t         246\t         116\t           0\t  26.730000\t  0.000000\t  0.500000\t  6.560000\t    0.000000\t             0.300000\t   36.590000\t              (null)\t     (null)
2463924\t       2\t2022-01-31T23:49:00+00:00\t2022-02-01T00:08:00+00:00\t         (null)\t     8.500000\t    (null)\t            (null)\t          18\t          75\t           0\t  25.410000\t  0.000000\t  0.500000\t  0.000000\t    0.000000\t             0.300000\t   26.210000\t              (null)\t     (null)
2463925\t       2\t2022-01-31T23:02:51+00:00\t2022-01-31T23:13:54+00:00\t         (null)\t     1.630000\t    (null)\t            (null)\t         224\t          90\t           0\t   9.710000\t  0.000000\t  0.500000\t  2.770000\t    0.000000\t             0.300000\t   15.780000\t              (null)\t     (null)
2463926\t       2\t2022-01-31T23:36:53+00:00\t2022-01-31T23:42:51+00:00\t         (null)\t     1.320000\t    (null)\t            (null)\t          90\t         170\t           0\t   8.000000\t  0.000000\t  0.500000\t  2.390000\t    0.000000\t             0.300000\t   13.690000\t              (null)\t     (null)
2463927\t       2\t2022-01-31T23:44:22+00:00\t2022-01-31T23:55:01+00:00\t         (null)\t     4.190000\t    (null)\t            (null)\t         107\t          75\t           0\t  16.800000\t  0.000000\t  0.500000\t  4.350000\t    0.000000\t             0.300000\t   24.450000\t              (null)\t     (null)
2463928\t       2\t2022-01-31T23:39:00+00:00\t2022-01-31T23:50:00+00:00\t         (null)\t     2.100000\t    (null)\t            (null)\t         113\t         246\t           0\t  11.220000\t  0.000000\t  0.500000\t  2.000000\t    0.000000\t             0.300000\t   16.520000\t              (null)\t     (null)
2463929\t       2\t2022-01-31T23:36:42+00:00\t2022-01-31T23:48:45+00:00\t         (null)\t     2.920000\t    (null)\t            (null)\t         148\t         164\t           0\t  12.400000\t  0.000000\t  0.500000\t  0.000000\t    0.000000\t             0.300000\t   15.700000\t              (null)\t     (null)
2463930\t       2\t2022-01-31T23:46:00+00:00\t2022-02-01T00:13:00+00:00\t         (null)\t     8.940000\t    (null)\t            (null)\t         186\t         181\t           0\t  25.480000\t  0.000000\t  0.500000\t  6.280000\t    0.000000\t             0.300000\t   35.060000\t              (null)\t     (null)
    TABLE
  end

  test("#each") do
    records = @dataset.each.to_a

    assert_equal([
                   2463931,
                   {
                     vendor: :creative_mobile_technologies,
                     tpep_pickup_datetime: Time.parse('2022-01-01 09:35:40 +0900'),
                     tpep_dropoff_datetime: Time.parse('2022-01-01 09:53:29 +0900'),
                     passenger_count: 2.0,
                     trip_distance: 3.8,
                     rate_code: :standard_rate,
                     store_and_fwd: false,
                     pu_location_id: 142,
                     do_location_id: 236,
                     payment: :credit_card,
                     fare_amount: 14.5,
                     extra: 3.0,
                     mta_tax: 0.5,
                     tip_amount: 3.65,
                     tolls_amount: 0.0,
                     improvement_surcharge: 0.3,
                     total_amount: 21.95,
                     congestion_surcharge: 2.5,
                     airport_fee: 0.0,
                   },
                   {
                     vendor: :veri_fone_inc,
                     tpep_pickup_datetime: Time.parse('2022-02-01 08:46:00 +0900'),
                     tpep_dropoff_datetime: Time.parse('2022-02-01 09:13:00 +0900'),
                     passenger_count: nil,
                     trip_distance: 8.94,
                     rate_code: nil,
                     store_and_fwd: false,
                     pu_location_id: 186,
                     do_location_id: 181,
                     payment: nil,
                     fare_amount: 25.48,
                     extra: 0.0,
                     mta_tax: 0.5,
                     tip_amount: 6.28,
                     tolls_amount: 0.0,
                     improvement_surcharge: 0.3,
                     total_amount: 35.06,
                     congestion_surcharge: nil,
                     airport_fee: nil
                  },
                 ],
                 [
                   records.size,
                   records.first.to_h,
                   records.last.to_h,
                 ])
  end
end
