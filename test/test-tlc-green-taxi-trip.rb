class TLCGreenTaxiTripTest < Test::Unit::TestCase
  test("each") do
    dataset = DatasetsParquet::TLC::GreenTaxiTrip.new(year: 2022, month: 1)
    records = dataset.each.to_a

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
