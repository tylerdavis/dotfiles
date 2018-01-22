function RailsTest()
  let file_path = expand('%:p')
  let test_line = search('\Wit\W.*\Wdo', 'bcn')
  let test_command = "bin/rails test " . file_path . ":" . test_line
  split
  enew
  call termopen(test_command)
endfunction
