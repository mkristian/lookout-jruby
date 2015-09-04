unless defined? JRUBY_VERSION
  exit
end

$: << File.expand_path( '../../lib', __FILE__ )

$CLASSPATH << File.dirname(__FILE__)

require 'lookout/jruby'
require 'yaml'

describe YAML do

  let( :expected ) { { 'hello' => 'world' } }

  it 'is not patched for jruby-9k' do
    if JRUBY_VERSION.start_with?('9.')
      expect( YAML.respond_to?(:_load_file) ).to be false
    end
  end

  it 'loads file from filesystem' do
    data = YAML.load_file(File.expand_path('../some.yml', __FILE__))
    expect( data ).to eq expected
  end

  it 'loads file from classloader' do
    data = YAML.load_file('uri:classloader:/some.yml')
    expect( data ).to eq expected
  end

end
 
