require 'test_helper'

class ReportMailerTest < ActionMailer::TestCase
  test "get_report" do
    mail = ReportMailer.get_report
    assert_equal "get_report", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
