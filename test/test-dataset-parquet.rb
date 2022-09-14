class TestDataset < Test::Unit::TestCase
  sub_test_case("#clear_cache!") do
    include Helper::PathRestorable

    def setup
      @dataset = DatasetsParquet::TLC::YellowTaxiTrip.new(year: 2022, month: 1)
      @cache_dir_path = @dataset.send(:cache_dir_path)
      @base_name = "yellow_tripdata_%04d-%02d.parquet" % [2022, 1]
    end

    test("when the dataset is downloaded") do
      @dataset.first # This ensures the dataset downloaded
      existence = {before: @cache_dir_path.join(@base_name).exist?}

      restore_path(@cache_dir_path) do
        @dataset.clear_cache!
        existence[:after] = @cache_dir_path.join(@base_name).exist?

        assert_equal({before: true, after: false},
                     existence)
      end
    end

    test("when the dataset is not downloaded") do
      restore_path(@cache_dir_path) do
        if @cache_dir_path.exist?
          FileUtils.rmtree(@cache_dir_path.to_s, secure: true)
        end

        assert_nothing_raised do
          @dataset.clear_cache!
        end
      end
    end
  end
end
