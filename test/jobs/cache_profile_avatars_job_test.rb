require 'minitest/mock'
require 'test_helper'

class CacheProfileAvatarsJobTest < ActiveJob::TestCase
  test "runs cache service for each profile" do
    service_mock = MiniTest::Mock.new
    service_mock.expect(:refresh!, true, [profiles(:frog)])
    service_mock.expect(:refresh!, true, [profiles(:sparse)])

    CacheProfileAvatarService.stub(:new, service_mock) do
      CacheProfileAvatarsJob.perform_now
    end

    assert_mock service_mock
  end

  test "enqueues another job after performing" do
    service_mock = MiniTest::Mock.new
    def service_mock.refresh!(_profile); true; end

    CacheProfileAvatarService.stub(:new, service_mock) do
      assert_enqueued_with(job: CacheProfileAvatarsJob) do
        CacheProfileAvatarsJob.perform_now
      end
    end
  end
end
