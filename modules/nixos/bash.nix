{
  programs.bash.interactiveShellInit = ''
    if [ -z "$BASH_EXECUTION_STRING" ]; then
      exec nu
    fi
  '';
}
