class TLCGreenTaxiTripTest < Test::Unit::TestCase
  def setup
    @dataset = DatasetsParquet::TLC::GreenTaxiTrip.new(year: 2022, month: 1)
  end

  test("#to_arrow") do
    assert_equal(<<~TABLE, @dataset.to_arrow.to_s)
\tVendorID\t     lpep_pickup_datetime\t    lpep_dropoff_datetime\tstore_and_fwd_flag\tRatecodeID\tPULocationID\tDOLocationID\tpassenger_count\ttrip_distance\tfare_amount\t     extra\t   mta_tax\ttip_amount\ttolls_amount\tehail_fee\timprovement_surcharge\ttotal_amount\tpayment_type\t trip_type\tcongestion_surcharge
    0\t       2\t2022-01-01T09:14:21+09:00\t2022-01-01T09:15:33+09:00\tN                 \t  1.000000\t          42\t          42\t       1.000000\t     0.440000\t   3.500000\t  0.500000\t  0.500000\t  0.000000\t    0.000000\t   (null)\t             0.300000\t    4.800000\t    2.000000\t  1.000000\t            0.000000
    1\t       1\t2022-01-01T09:20:55+09:00\t2022-01-01T09:29:38+09:00\tN                 \t  1.000000\t         116\t          41\t       1.000000\t     2.100000\t   9.500000\t  0.500000\t  0.500000\t  0.000000\t    0.000000\t   (null)\t             0.300000\t   10.800000\t    2.000000\t  1.000000\t            0.000000
    2\t       1\t2022-01-01T09:57:02+09:00\t2022-01-01T10:13:14+09:00\tN                 \t  1.000000\t          41\t         140\t       1.000000\t     3.700000\t  14.500000\t  3.250000\t  0.500000\t  4.600000\t    0.000000\t   (null)\t             0.300000\t   23.150000\t    1.000000\t  1.000000\t            2.750000
    3\t       2\t2022-01-01T09:07:42+09:00\t2022-01-01T09:15:57+09:00\tN                 \t  1.000000\t         181\t         181\t       1.000000\t     1.690000\t   8.000000\t  0.500000\t  0.500000\t  0.000000\t    0.000000\t   (null)\t             0.300000\t    9.300000\t    2.000000\t  1.000000\t            0.000000
    4\t       2\t2022-01-01T09:07:50+09:00\t2022-01-01T09:28:52+09:00\tN                 \t  1.000000\t          33\t         170\t       1.000000\t     6.260000\t  22.000000\t  0.500000\t  0.500000\t  5.210000\t    0.000000\t   (null)\t             0.300000\t   31.260000\t    1.000000\t  1.000000\t            2.750000
    5\t       1\t2022-01-01T09:47:57+09:00\t2022-01-01T09:54:09+09:00\tN                 \t  1.000000\t         150\t         210\t       1.000000\t     1.300000\t   7.000000\t  0.500000\t  0.500000\t  0.000000\t    0.000000\t   (null)\t             0.300000\t    8.300000\t    2.000000\t  1.000000\t            0.000000
    6\t       2\t2022-01-01T09:13:38+09:00\t2022-01-01T09:33:50+09:00\tN                 \t  1.000000\t          66\t          67\t       1.000000\t     6.470000\t  22.500000\t  0.500000\t  0.500000\t  0.000000\t    0.000000\t   (null)\t             0.300000\t   23.800000\t    2.000000\t  1.000000\t            0.000000
    7\t       2\t2022-01-01T09:43:00+09:00\t2022-01-01T09:49:20+09:00\tN                 \t  1.000000\t          40\t         195\t       1.000000\t     1.150000\t   6.000000\t  0.500000\t  0.500000\t  0.000000\t    0.000000\t   (null)\t             0.300000\t    7.300000\t    2.000000\t  1.000000\t            0.000000
    8\t       2\t2022-01-01T09:41:04+09:00\t2022-01-01T09:47:04+09:00\tN                 \t  1.000000\t         112\t          80\t       1.000000\t     1.300000\t   6.000000\t  0.500000\t  0.500000\t  0.000000\t    0.000000\t   (null)\t             0.300000\t    7.300000\t    2.000000\t  1.000000\t            0.000000
    9\t       2\t2022-01-01T09:51:07+09:00\t2022-01-01T10:09:31+09:00\tN                 \t  1.000000\t         256\t         186\t       1.000000\t     4.750000\t  17.000000\t  0.500000\t  0.500000\t  4.210000\t    0.000000\t   (null)\t             0.300000\t   25.260000\t    1.000000\t  1.000000\t            2.750000
...
62485\t       2\t2022-02-01T07:01:00+09:00\t2022-02-01T07:13:00+09:00\t            (null)\t    (null)\t         244\t         151\t         (null)\t     4.690000\t  19.010000\t  0.000000\t  0.000000\t  4.120000\t    0.000000\t   (null)\t             0.300000\t   26.180000\t      (null)\t    (null)\t              (null)
62486\t       2\t2022-02-01T07:54:00+09:00\t2022-02-01T08:10:00+09:00\t            (null)\t    (null)\t          25\t         188\t         (null)\t     3.120000\t  13.900000\t  0.000000\t  0.000000\t  3.160000\t    0.000000\t   (null)\t             0.300000\t   17.360000\t      (null)\t    (null)\t              (null)
62487\t       2\t2022-02-01T08:23:00+09:00\t2022-02-01T08:39:00+09:00\t            (null)\t    (null)\t         179\t         112\t         (null)\t     3.800000\t  16.480000\t  0.000000\t  0.000000\t  3.730000\t    0.000000\t   (null)\t             0.300000\t   20.510000\t      (null)\t    (null)\t              (null)
62488\t       2\t2022-02-01T08:50:00+09:00\t2022-02-01T09:11:00+09:00\t            (null)\t    (null)\t         112\t         239\t         (null)\t     6.040000\t  23.450000\t  0.000000\t  0.000000\t  5.830000\t    0.000000\t   (null)\t             0.300000\t   32.330000\t      (null)\t    (null)\t              (null)
62489\t       2\t2022-02-01T08:19:00+09:00\t2022-02-01T08:37:00+09:00\t            (null)\t    (null)\t         152\t         233\t         (null)\t     6.710000\t  25.400000\t  0.000000\t  0.000000\t  6.270000\t    0.000000\t   (null)\t             0.300000\t   34.720000\t      (null)\t    (null)\t              (null)
62490\t       2\t2022-02-01T08:25:00+09:00\t2022-02-01T08:33:00+09:00\t            (null)\t    (null)\t          40\t          65\t         (null)\t     1.400000\t   8.380000\t  0.000000\t  0.000000\t  1.930000\t    0.000000\t   (null)\t             0.300000\t   10.610000\t      (null)\t    (null)\t              (null)
62491\t       2\t2022-02-01T08:52:00+09:00\t2022-02-01T09:10:00+09:00\t            (null)\t    (null)\t          36\t          61\t         (null)\t     2.970000\t  14.920000\t  0.000000\t  0.000000\t  0.000000\t    0.000000\t   (null)\t             0.300000\t   15.220000\t      (null)\t    (null)\t              (null)
62492\t       2\t2022-02-01T08:17:00+09:00\t2022-02-01T08:36:00+09:00\t            (null)\t    (null)\t          75\t         167\t         (null)\t     3.700000\t  16.260000\t  0.000000\t  0.000000\t  0.000000\t    0.000000\t   (null)\t             0.300000\t   16.560000\t      (null)\t    (null)\t              (null)
62493\t       2\t2022-02-01T08:45:00+09:00\t2022-02-01T08:55:00+09:00\t            (null)\t    (null)\t         116\t         166\t         (null)\t     1.880000\t   9.480000\t  0.000000\t  0.000000\t  2.170000\t    0.000000\t   (null)\t             0.300000\t   11.950000\t      (null)\t    (null)\t              (null)
62494\t       2\t2022-02-01T08:52:00+09:00\t2022-02-01T09:26:00+09:00\t            (null)\t    (null)\t         225\t         179\t         (null)\t     9.600000\t  32.180000\t  0.000000\t  0.000000\t  7.230000\t   10.000000\t   (null)\t             0.300000\t   49.710000\t      (null)\t    (null)\t              (null)
    TABLE
  end

  test("#each") do
    records = @dataset.each.to_a

    assert_equal([
                   62495,
                   {
                     vendor: :veri_fone_inc,
                     lpep_pickup_datetime: Time.parse('2022-01-01 09:14:21 +0900'),
                     lpep_dropoff_datetime: Time.parse('2022-01-01 09:15:33 +0900'),
                     store_and_fwd: false,
                     rate_code: :standard_rate,
                     pu_location_id: 42,
                     do_location_id: 42,
                     passenger_count: 1.0,
                     trip_distance: 0.44,
                     fare_amount: 3.5,
                     extra: 0.5,
                     mta_tax: 0.5,
                     tip_amount: 0.0,
                     tolls_amount: 0.0,
                     ehail_fee: nil,
                     improvement_surcharge: 0.3,
                     total_amount: 4.8,
                     payment: :cash,
                     trip: :street_hail,
                     congestion_surcharge: 0.0,
                   },
                   {
                     vendor: :veri_fone_inc,
                     lpep_pickup_datetime: Time.parse('2022-02-01 08:52:00 +0900'),
                     lpep_dropoff_datetime: Time.parse('2022-02-01 09:26:00 +0900'),
                     store_and_fwd: false,
                     rate_code: nil,
                     pu_location_id: 225,
                     do_location_id: 179,
                     passenger_count: nil,
                     trip_distance: 9.6,
                     fare_amount: 32.18,
                     extra: 0.0,
                     mta_tax: 0.0,
                     tip_amount: 7.23,
                     tolls_amount: 10.0,
                     ehail_fee: nil,
                     improvement_surcharge: 0.3,
                     total_amount: 49.71,
                     payment: nil,
                     trip: nil,
                     congestion_surcharge: nil,
                   }
                 ],
                 [
                   records.size,
                   records.first.to_h,
                   records.last.to_h,
                 ])
  end
end
