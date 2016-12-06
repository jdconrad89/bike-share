require './spec/spec_helper'

describe "Trip" do
  context "analytics" do

    it "can find total count of trips" do
      Trip.create(duration_in_seconds: 187, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 7, end_station_id: 12, bike_id: 17, subscription_type: "Customer", zipcode_id: 81420)
      Trip.create(duration_in_seconds: 69, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 7, end_station_id: 12, bike_id: 17, subscription_type: "Customer", zipcode_id: 81420)

      expect(Trip.total).to eq(2)
    end

    it "can find average duration of a ride" do
      Trip.create(duration_in_seconds: 187, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 7, end_station_id: 12, bike_id: 17, subscription_type: "Customer", zipcode_id: 81420)
      Trip.create(duration_in_seconds: 69, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 7, end_station_id: 12, bike_id: 17, subscription_type: "Customer", zipcode_id: 81420)
      Trip.create(duration_in_seconds: 271, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 7, end_station_id: 12, bike_id: 17, subscription_type: "Customer", zipcode_id: 81420)

      expect(Trip.average_duration_of_ride).to eq(176)
    end

    it "can find the longest ride" do
      Trip.create(duration_in_seconds: 187, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 7, end_station_id: 12, bike_id: 17, subscription_type: "Customer", zipcode_id: 81420)
      Trip.create(duration_in_seconds: 69, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 7, end_station_id: 12, bike_id: 17, subscription_type: "Customer", zipcode_id: 81420)
      Trip.create(duration_in_seconds: 271, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 7, end_station_id: 12, bike_id: 17, subscription_type: "Customer", zipcode_id: 81420)

      expect(Trip.longest_ride).to eq(271)
    end

    it "can find the shortest ride" do
      Trip.create(duration_in_seconds: 187, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 7, end_station_id: 12, bike_id: 17, subscription_type: "Customer", zipcode_id: 81420)
      Trip.create(duration_in_seconds: 69, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 7, end_station_id: 12, bike_id: 17, subscription_type: "Customer", zipcode_id: 81420)
      Trip.create(duration_in_seconds: 271, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 7, end_station_id: 12, bike_id: 17, subscription_type: "Customer", zipcode_id: 81420)

      expect(Trip.shortest_ride).to eq(69)
    end

    it "can find station with most rides starting there" do
      Trip.create(duration_in_seconds: 187, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 7, end_station_id: 12, bike_id: 17, subscription_type: "Customer", zipcode_id: 81420)
      Trip.create(duration_in_seconds: 69, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 7, end_station_id: 12, bike_id: 17, subscription_type: "Customer", zipcode_id: 81420)
      Trip.create(duration_in_seconds: 271, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 1, end_station_id: 19, bike_id: 17, subscription_type: "Customer", zipcode_id: 81420)
      Trip.create(duration_in_seconds: 561, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 2, end_station_id: 7, bike_id: 17, subscription_type: "Customer", zipcode_id: 81420)

      expect(Trip.most_rides_starting).pluck(:id)).to eq(7)
    end

    it "can find station with most rides ending there" do
      Trip.create(duration_in_seconds: 187, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 7, end_station_id: 12, bike_id: 17, subscription_type: "Customer", zipcode_id: 81420)
      Trip.create(duration_in_seconds: 69, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 7, end_station_id: 12, bike_id: 17, subscription_type: "Customer", zipcode_id: 81420)
      Trip.create(duration_in_seconds: 271, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 1, end_station_id: 19, bike_id: 17, subscription_type: "Customer", zipcode_id: 81420)
      Trip.create(duration_in_seconds: 561, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 2, end_station_id: 7, bike_id: 17, subscription_type: "Customer", zipcode_id: 81420)

      expect(Trip.most_rides_ending).pluck(:id)).to eq(12)
    end

    it "can find trip rides per month" do
      Trip.create(duration_in_seconds: 187, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 7, end_station_id: 12, bike_id: 17, subscription_type: "Customer", zipcode_id: 81420)
      Trip.create(duration_in_seconds: 69, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 7, end_station_id: 12, bike_id: 17, subscription_type: "Customer", zipcode_id: 81420)
      Trip.create(duration_in_seconds: 271, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 1, end_station_id: 19, bike_id: 17, subscription_type: "Customer", zipcode_id: 81420)
      Trip.create(duration_in_seconds: 561, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 2, end_station_id: 7, bike_id: 17, subscription_type: "Customer", zipcode_id: 81420)
      
      expect(Trip.rides_per_month).to eq(4)
    end

    it "can find trip rides per year" do
      Trip.create(duration_in_seconds: 187, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 7, end_station_id: 12, bike_id: 17, subscription_type: "Customer", zipcode_id: 81420)
      Trip.create(duration_in_seconds: 69, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 7, end_station_id: 12, bike_id: 17, subscription_type: "Customer", zipcode_id: 81420)
      Trip.create(duration_in_seconds: 271, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 1, end_station_id: 19, bike_id: 17, subscription_type: "Customer", zipcode_id: 81420)
      Trip.create(duration_in_seconds: 561, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 2, end_station_id: 7, bike_id: 17, subscription_type: "Customer", zipcode_id: 81420)
      
      expect(Trip.rides_that_year).to eq(4)
    end

    it "can find most ridden bike" do
      Trip.create(duration_in_seconds: 187, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 7, end_station_id: 12, bike_id: 17, subscription_type: "Customer", zipcode_id: 81420)
      Trip.create(duration_in_seconds: 69, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 7, end_station_id: 12, bike_id: 7, subscription_type: "Customer", zipcode_id: 81420)
      Trip.create(duration_in_seconds: 271, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 1, end_station_id: 19, bike_id: 17, subscription_type: "Customer", zipcode_id: 81420)
      Trip.create(duration_in_seconds: 561, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 2, end_station_id: 7, bike_id: 9, subscription_type: "Customer", zipcode_id: 81420)
      
      expect(Trip.most_ridden_bike).to eq(17)
    end

    it "can find least ridden bike" do
      Trip.create(duration_in_seconds: 187, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 7, end_station_id: 12, bike_id: 17, subscription_type: "Customer", zipcode_id: 81420)
      Trip.create(duration_in_seconds: 69, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 7, end_station_id: 12, bike_id: 7, subscription_type: "Customer", zipcode_id: 81420)
      Trip.create(duration_in_seconds: 271, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 1, end_station_id: 19, bike_id: 17, subscription_type: "Customer", zipcode_id: 81420)
      Trip.create(duration_in_seconds: 561, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 2, end_station_id: 7, bike_id: 9, subscription_type: "Customer", zipcode_id: 81420)
      Trip.create(duration_in_seconds: 562, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 2, end_station_id: 7, bike_id: 9, subscription_type: "Customer", zipcode_id: 81420)

      expect(Trip.least_ridden_bike).to eq(7)
    end

    it "can find user subscription stats" do
      Trip.create(duration_in_seconds: 187, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 7, end_station_id: 12, bike_id: 17, subscription_type: "Customer", zipcode_id: 81420)
      Trip.create(duration_in_seconds: 69, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 7, end_station_id: 12, bike_id: 7, subscription_type: "Subscriber", zipcode_id: 81420)
      Trip.create(duration_in_seconds: 271, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 1, end_station_id: 19, bike_id: 17, subscription_type: "Customer", zipcode_id: 81420)
      Trip.create(duration_in_seconds: 561, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 2, end_station_id: 7, bike_id: 9, subscription_type: "Subscriber", zipcode_id: 81420)
      Trip.create(duration_in_seconds: 367, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 2, end_station_id: 7, bike_id: 9, subscription_type: "Subscriber", zipcode_id: 81420)

      expect(Trip.number_customers).to eq(2)
      expect(Trip.number_subscribers).to eq(3)
      expect(Trip.user_percentage("Customer")).to eq(40)
      expect(Trip.user_percentage("Suscriber")).to eq(60)
    end
    
    it "can find highest trip date" do
      Trip.create(duration_in_seconds: 187, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 7, end_station_id: 12, bike_id: 17, subscription_type: "Customer", zipcode_id: 81420)
      Trip.create(duration_in_seconds: 69, start_date: "September 15, 1989", end_date: "September 15, 1989", start_station_id: 7, end_station_id: 12, bike_id: 7, subscription_type: "Customer", zipcode_id: 81420)
      Trip.create(duration_in_seconds: 271, start_date: "September 29, 1989", end_date: "September 29, 1989", start_station_id: 1, end_station_id: 19, bike_id: 17, subscription_type: "Customer", zipcode_id: 81420)
      Trip.create(duration_in_seconds: 561, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 2, end_station_id: 7, bike_id: 9, subscription_type: "Customer", zipcode_id: 81420)
      
      expect(Trip.highest_trip_date).to eq("1989-09-09")
    end

    it "can find lowest trip date" do
      Trip.create(duration_in_seconds: 187, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 7, end_station_id: 12, bike_id: 17, subscription_type: "Customer", zipcode_id: 81420)
      Trip.create(duration_in_seconds: 69, start_date: "September 19, 1989", end_date: "September 19, 1989", start_station_id: 7, end_station_id: 12, bike_id: 7, subscription_type: "Customer", zipcode_id: 81420)
      Trip.create(duration_in_seconds: 271, start_date: "September 29, 1989", end_date: "September 29, 1989", start_station_id: 1, end_station_id: 19, bike_id: 17, subscription_type: "Customer", zipcode_id: 81420)
      Trip.create(duration_in_seconds: 560, start_date: "September 9, 1989", end_date: "September 9, 1989", start_station_id: 2, end_station_id: 7, bike_id: 9, subscription_type: "Customer", zipcode_id: 81420)
      Trip.create(duration_in_seconds: 363, start_date: "September 19, 1989", end_date: "September 19, 1989", start_station_id: 2, end_station_id: 7, bike_id: 9, subscription_type: "Customer", zipcode_id: 81420)
      Trip.create(duration_in_seconds: 561, start_date: "September 19, 1989", end_date: "September 19, 1989", start_station_id: 2, end_station_id: 7, bike_id: 9, subscription_type: "Customer", zipcode_id: 81420)

      expect(Trip.lowest_trip_date).to eq("1989-09-19")
    end
  end
end