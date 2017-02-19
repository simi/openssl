# frozen_string_literal: false
require_relative 'utils'

class OpenSSL::TestFIPS < OpenSSL::TestCase

  def test_fips_mode_getter
    omit("FIPS not present") unless OpenSSL::OPENSSL_FIPS

    # FIPS is disabled in utils.rb for whole test run
    assert_equal false, OpenSSL.fips_mode
  end

  def test_fips_mode_is_reentrant
    OpenSSL.fips_mode = false
    OpenSSL.fips_mode = false
  end

end
