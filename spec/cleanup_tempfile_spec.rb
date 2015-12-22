unless defined? JRUBY_VERSION
  exit
end

$: << File.expand_path( '../../lib', __FILE__ )

describe 'cleanup tempfiles' do

  it 'cleanup  /tmp/jruby-*/jruby*.jar' do
    args = [ RbConfig.ruby,
             '-J-cp',
             File.expand_path( '../test.jar', __FILE__ ),
             '-e',
             'require \'uri:classloader:/my.jar\'; sleep 1234;' ]

    pid = Process.spawn(*args)
    # give jruby some time to start
    sleep 10

    tmpdir = File.join( ENV_JAVA['java.io.tmpdir'], "jruby-#{pid}" )
    unless File.directory?(tmpdir)
      # some OS give the right PID some uses bash to start java
      tmpdir = File.join( ENV_JAVA['java.io.tmpdir'], "jruby-#{pid + 1}" )
    end

    tmpfiles = File.join( tmpdir, 'jruby*.jar' )
 
    expect(Dir[tmpfiles].size).to be > 0

    if JRUBY_VERSION.start_with?('1.')
      system("kill -9 #{pid}")
    else
      Process.kill(9, pid)
    end

    # let be killed
    sleep 1

    require 'lookout/jruby'

    # execute the clean manually for the test
    Lookout::Jruby.cleanup_tempfiles

    expect(Dir[tmpfiles].size).to eq 0
  end

end
 
