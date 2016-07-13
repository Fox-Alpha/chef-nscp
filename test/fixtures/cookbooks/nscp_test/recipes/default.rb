
nscp_check 'check_nsclient' do
  command 'check_ok.bat'
end

nscp_check 'check_test1' do
  command 'check_test.ps1'
  arguments %w(arg1 arg2)
end
