#!/usr/bin/env ruby

# runs xtc job + local simulator tests
# see Briar/jenkins-calabash.sh

require File.expand_path(File.join(File.dirname(__FILE__), 'ci-helpers'))
require File.expand_path(File.join(File.dirname(__FILE__), 'run-develop'))

xtc_device_set = ARGV[0] || '3f009268'
xtc_profile = ARGV[1] || 'default'
xtc_series = ARGV[2] || 'nightly-develop'

# accept 2 additional cucumber args for -t < tags >
cucumber_args = ''
if ARGV.count == 4
  cucumber_args = "#{ARGV[2]} #{ARGV[3]}"
end

run_develop xtc_device_set, xtc_profile,  xtc_series

working_dir = File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'Briar'))

Dir.chdir working_dir do

  # sometimes json 1.8.1 cannot be found
  install_gem 'json'

  do_system("./jenkins-calabash.sh #{cucumber_args}")
end
