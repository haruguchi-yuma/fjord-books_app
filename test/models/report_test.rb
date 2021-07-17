# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test "#editable?" do
    @alice = users(:Alice)
    @bob = users(:Bob)
    @report = reports(:one)

    assert_not @report.editable?(@bob)
    assert @report.editable?(@alice)
  end

  test "#created_on" do
    @report = reports(:one)
    @report.created_at = 'Sat, 17 Jul 2021 14:16:52.298299000 JST +09:00'

    assert_not_equal 'Sat, 17 Jul 2021', @report.created_on
    assert_equal 'Sat, 17 Jul 2021'.to_date, @report.created_on
  end
end
