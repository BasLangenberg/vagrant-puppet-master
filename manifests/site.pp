class { 'puppet_stack':
  ruby_vers                => 'ruby-2.0.0-p643',
  passenger_vers           => '4.0.40',
  global_passenger_options => {
    'PassengerDefaultUser'        => 'apache',
    'PassengerFriendlyErrorPages' => 'on',
    'PassengerMinInstances'       => '2'
  },
  puppet                   => true,
  puppet_role              => 'aio',
  foreman                  => false,
  smartproxy               => false,
}
