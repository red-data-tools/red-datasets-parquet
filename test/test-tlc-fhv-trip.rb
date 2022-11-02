class TLCFHVTripTest < Test::Unit::TestCase
  def setup
    @default_timezone_env = ENV['TZ']
    ENV['TZ'] = 'UTC'
    @dataset = Datasets::TLC::FHVTrip.new(year: 2022, month: 1)
  end

  def teardown
    ENV['TZ'] = @default_timezone_env
  end

  test("#to_arrow") do
    assert_equal(<<~TABLE, @dataset.to_arrow.to_s)
\tdispatching_base_num\t          pickup_datetime\t         dropOff_datetime\tPUlocationID\tDOlocationID\tSR_Flag\tAffiliated_base_number
      0\tB00009              \t2022-01-01T00:31:00+00:00\t2022-01-01T01:05:00+00:00\t      (null)\t      (null)\t (null)\tB00009                
      1\tB00009              \t2022-01-01T00:37:00+00:00\t2022-01-01T01:05:00+00:00\t      (null)\t      (null)\t (null)\tB00009                
      2\tB00037              \t2022-01-01T00:56:37+00:00\t2022-01-01T01:06:11+00:00\t      (null)\t   85.000000\t (null)\tB00037                
      3\tB00037              \t2022-01-01T00:19:54+00:00\t2022-01-01T00:30:47+00:00\t      (null)\t   85.000000\t (null)\tB00037                
      4\tB00037              \t2022-01-01T00:41:49+00:00\t2022-01-01T00:52:16+00:00\t      (null)\t  188.000000\t (null)\tB00037                
      5\tB00037              \t2022-01-01T00:21:32+00:00\t2022-01-01T00:35:06+00:00\t      (null)\t   61.000000\t (null)\tB00037                
      6\tB00037              \t2022-01-01T00:51:19+00:00\t2022-01-01T01:08:06+00:00\t      (null)\t   76.000000\t (null)\tB00037                
      7\tB00111              \t2022-01-01T00:30:00+00:00\t2022-01-01T01:41:00+00:00\t      (null)\t      (null)\t (null)\tB03406                
      8\tB00112              \t2022-01-01T00:31:30+00:00\t2022-01-01T01:10:06+00:00\t      (null)\t   67.000000\t (null)\tB00112                
      9\tB00112              \t2022-01-01T00:12:26+00:00\t2022-01-01T00:37:22+00:00\t      (null)\t  155.000000\t (null)\tB00112                
...
1143681\tB03380              \t2022-01-31T23:39:32+00:00\t2022-01-31T23:47:43+00:00\t  246.000000\t  158.000000\t (null)\tB03380                
1143682\tB03380              \t2022-01-31T23:52:52+00:00\t2022-02-01T00:03:14+00:00\t  158.000000\t  107.000000\t (null)\tB03380                
1143683\tB03380              \t2022-01-31T23:24:44+00:00\t2022-01-31T23:35:46+00:00\t  231.000000\t    4.000000\t (null)\tB03380                
1143684\tB03380              \t2022-01-31T23:21:35+00:00\t2022-01-31T23:32:16+00:00\t  229.000000\t   48.000000\t (null)\tB03380                
1143685\tB03380              \t2022-01-31T23:02:50+00:00\t2022-01-31T23:20:07+00:00\t  142.000000\t  113.000000\t (null)\tB03380                
1143686\tB03380              \t2022-01-31T23:22:41+00:00\t2022-01-31T23:26:39+00:00\t  234.000000\t  107.000000\t (null)\tB03380                
1143687\tB03380              \t2022-01-31T23:42:42+00:00\t2022-01-31T23:52:58+00:00\t  114.000000\t  148.000000\t (null)\tB03380                
1143688\tB03380              \t2022-01-31T23:07:13+00:00\t2022-01-31T23:13:40+00:00\t   90.000000\t  113.000000\t (null)\tB03380                
1143689\tB03380              \t2022-01-31T23:16:14+00:00\t2022-01-31T23:31:03+00:00\t  113.000000\t  140.000000\t (null)\tB03380                
1143690\tB03381              \t2022-01-31T23:47:42+00:00\t2022-02-01T00:15:03+00:00\t      (null)\t  122.000000\t (null)\tB03404                
    TABLE
  end

  test("#each") do
    records = @dataset.each.to_a

    assert_equal([
                   1143691,
                   {
                     dispatching_base_num: 'B00009',
                     pickup_datetime: Time.parse('2022-01-01 00:31:00 +0000'),
                     dropoff_datetime: Time.parse('2022-01-01 01:05:00 +0000'),
                     pu_location_id: nil,
                     do_location_id: nil,
                     sr_flag: false,
                     affiliated_base_number: 'B00009'
                   },
                   {
                     dispatching_base_num: 'B03381',
                     pickup_datetime: Time.parse('2022-01-31 23:47:42 +0000'),
                     dropoff_datetime: Time.parse('2022-02-01 00:15:03 +0000'),
                     pu_location_id: nil,
                     do_location_id: 122.0,
                     sr_flag: false,
                     affiliated_base_number: 'B03404'
                   }
                 ],
                 [
                   records.size,
                   records.first.to_h,
                   records.last.to_h,
                 ])
  end
end
