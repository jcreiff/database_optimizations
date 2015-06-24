require 'test_helper'

class ReportMailerTest < ActionMailer::TestCase
  test "get_report" do
    mail = ReportMailer.get_report("test@example.com", "a1")
    assert_equal "Report for Assembly a1", mail.subject
    assert_equal ["test@example.com"], mail.to
    assert_equal ["joe@joe.com"], mail.from
    assert_match "Hits for a1", mail.body.encoded
  end

end
