class TLCYellowTaxiTripTest < Test::Unit::TestCase
  def record(*args)
    DatasetsParquet::TLC::YellowTaxiTrip::Record.new(*args)
  end

  test("each") do
    dataset = DatasetsParquet::TLC::YellowTaxiTrip.new(year: 2022, month: 1)
    records = dataset.each.to_a

    assert_equal([
                   2463931,
                   record(1,
                          Time.parse('2022-01-01 09:35:40 +0900'),
                          Time.parse('2022-01-01 09:53:29 +0900'),
                          2.0,
                          3.8,
                          1.0,
                          'N',
                          142,
                          236,
                          1,
                          14.5,
                          3.0,
                          0.5,
                          3.65,
                          0.0,
                          0.3,
                          21.95,
                          2.5,
                          0.0).to_h,
                   record(2,
                          Time.parse('2022-02-01 08:46:00 +0900'),
                          Time.parse('2022-02-01 09:13:00 +0900'),
                          nil,
                          8.94,
                          nil,
                          nil,
                          186,
                          181,
                          nil,
                          25.48,
                          0.0,
                          0.5,
                          6.28,
                          0.0,
                          0.3,
                          35.06,
                          nil,
                          nil).to_h
                 ],
                 [
                   records.size,
                   records.first.to_h,
                   records.last.to_h,
                 ])
  end
end
