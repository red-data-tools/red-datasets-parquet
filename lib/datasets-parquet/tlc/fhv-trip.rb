module Datasets
  module TLC
    class FHVTrip < Dataset
      class Record < Struct.new(:dispatching_base_num,
                                :pickup_datetime,
                                :dropoff_datetime,
                                :pu_location_id,
                                :do_location_id,
                                :sr_flag,
                                :affiliated_base_number)
        alias_method :sr_flag?, :sr_flag

        def initialize(*values)
          super()
          members.zip(values) do |member, value|
            __send__("#{member}=", value)
          end
        end

        def sr_flag=(sr_flag)
          super(!!sr_flag)
        end
      end

      def initialize(year: Date.today.year, month: Date.today.month)
        super()
        @metadata.id = "nyc-taxi-and-limousine-commission-for-hire-vehicle-trip"
        @metadata.name = "New York city Taxi and Limousine Commission: for hire vehicle trip record dataset"
        @metadata.url = "https://www1.nyc.gov/site/tlc/about/tlc-trip-record-data.page"
        @metadata.licenses = [
          {
            name: "NYC Open Data Terms of Use",
            url: "https://opendata.cityofnewyork.us/overview/#termsofuse",
          }
        ]
        @year = year
        @month = month
      end

      def to_arrow
        base_name = "fhv_tripdata_%04d-%02d.parquet" % [@year, @month]
        data_path = cache_dir_path + base_name
        data_url = "https://d37ci6vzurychx.cloudfront.net/trip-data/#{base_name}"
        download(data_path, data_url)
        Arrow::Table.load(data_path)
      end

      def each
        return to_enum(__method__) unless block_given?

        to_arrow.raw_records.each do |raw_record|
          record = Record.new(*raw_record)
          yield(record)
        end
      end
    end
  end
end
