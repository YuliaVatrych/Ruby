require 'rspec'
require_relative 'new_validation'

RSpec.describe Validation do
  describe ".valid_name?" do
    valid_names = ["Юлія", "Анна-Марія", "Анна-Марія-Вікторія-Анна"]
    invalid_names = ["Анна-Марія-вікторія-Анна", "Анна.Марія", "Анна-", "Анна-Марія-", "-Анна-Марія", "АнНа-МарІЯ", "ЮлІя", "юлія", "1234"]

    valid_names.each do |name|
      it "returns true for valid name '#{name}'" do
        expect(Validation.valid_name?(name)).to be_truthy
      end
    end

    invalid_names.each do |name|
      it "returns false for invalid name '#{name}'" do
        expect(Validation.valid_name?(name)).to be_falsey
      end
    end
  end

  describe ".valid_date_of_birth?" do
    valid_dates = [Time.new(2003, 1, 28), Time.now - 1]
    invalid_dates = [Time.new(2100, 1, 1), Time.now + 1]

    valid_dates.each do |date|
      it "returns true for valid date of birth '#{date}'" do
        expect(Validation.valid_date_of_birth?(date)).to eq(true)
      end
    end

    invalid_dates.each do |date|
      it "returns false for invalid date of birth '#{date}'" do
        expect(Validation.valid_date_of_birth?(date)).to eq(false)
      end
    end
  end

  describe ".valid_id?" do
    valid_ids = ["AB1234567890"]
    invalid_ids = ["1234567890", "Az1234567890", "ІЙ1234567890"]

    valid_ids.each do |id|
      it "returns true for valid ID '#{id}'" do
        expect(Validation.valid_id?(id)).to eq(true)
      end
    end

    invalid_ids.each do |id|
      it "returns false for invalid ID '#{id}'" do
        expect(Validation.valid_id?(id)).to eq(false)
      end
    end
  end
end
