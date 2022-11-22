module Datasets
  module TLC
    class HighVolumeFHVTrip < Dataset
      class Record < Struct.new(:hvfhs_license_num,
                                :dispatching_base_num,
                                :originating_base_num,
                                :request_datetime,
                                :on_scene_datetime,
                                :pickup_datetime,
                                :dropoff_datetime,
                                :pu_locationID,
                                :do_locationID,
                                :trip_miles,
                                :trip_time,
                                :base_passenger_fare,
                                :tolls,
                                :bcf,
                                :sales_tax,
                                :congestion_surcharge,
                                :airport_fee,
                                :tips,
                                :driver_pay,
                                :shared_request_flag,
                                :shared_match_flag,
                                :access_a_ride_flag,
                                :wav_request_flag,
                                :wav_match_flag)
        alias_method :shared_request_flag?, :shared_request_flag
        alias_method :shared_match_flag?, :shared_match_flag
        alias_method :access_a_ride_flag?, :access_a_ride_flag
        alias_method :wav_request_flag?, :wav_request_flag
        alias_method :wav_match_flag?, :wav_match_flag

        def initialize(*values)
          super()
          members.zip(values) do |member, value|
            __send__("#{member}=", value)
          end
        end

        def hvfhs_license_num=(hvfhs_license_num)
          case hvfhs_license_num
          when 'HV0002'
            super(:juno)
          when 'HV0003'
            super(:uber)
          when 'HV0004'
            super(:via)
          when 'HV0005'
            super(:lyft)
          end
        end

        def shared_request_flag=(shared_request_flag)
          super(shared_request_flag == 'Y')
        end

        def shared_match_flag=(shared_match_flag)
          super(shared_match_flag == 'Y')
        end

        def access_a_ride_flag=(access_a_ride_flag)
          super(access_a_ride_flag == 'Y')
        end

        def wav_request_flag=(wav_request_flag)
          super(wav_request_flag == 'Y')
        end

        def wav_match_flag=(wav_match_flag)
          super(wav_match_flag == 'Y')
        end
      end

      def initialize(year: Date.today.year, month: Date.today.month)
        super()
        @metadata.id = "nyc-taxi-and-limousine-commission-high-volume-for-hire-vehicle-trip"
        @metadata.name = "New York city Taxi and Limousine Commission: high volume for hire vehicle trip record dataset"
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
        base_name = "fhvhv_tripdata_%04d-%02d.parquet" % [@year, @month]
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
