class TLCYellowTaxiTripTest < Test::Unit::TestCase
  test("each") do
    dataset = DatasetsParquet::TLC::YellowTaxiTrip.new(year: 2022, month: 1)
    records = dataset.each.to_a

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
