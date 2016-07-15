require 'spec_helper'

describe 'Chocolatey' do
  it 'should be installed' do
    expect(file('C:/ProgramData/chocolatey/choco.exe')).to exist
  end
end

describe 'NSClient++' do
  it 'is listening on port 5666' do
    expect(port(5666)).to be_listening
  end

  it 'has a running service of nscp' do
    expect(service('nscp')).to have_start_mode('Automatic')
    expect(service('nscp')).to be_running
  end

  it 'has configuration files' do
    expect(file('C:/Program Files/NSClient++/nsclient.ini')).to be_file
    expect(file('C:/Program Files/NSClient++/nsclient_scripts.ini')).to be_file
  end

  it 'has testing checks configured' do
    expect(
      command(" & 'C:/Program Files/NSClient++/check_nrpe.exe' host=127.0.0.1 no-ssl command=check_nsclient").stdout
    ).to match('Everything is going to be fine')

    expect(
      command(" & 'C:/Program Files/NSClient++/check_nrpe.exe' host=127.0.0.1 no-ssl command=check_test1 arguments=my_test").stdout
    ).to match('my_test')
  end
end
