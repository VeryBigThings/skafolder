#!/bin/bash
function my_help () {
# Using a here doc with standard out.
cat <<-END
Usage:
------
   -h | --help
     Display this help
   --file FILE_NAME
     Seeds specified file. Folder for seed file is "priv/repo/" + seed_file_name
------
If no options provided, it will seed default seed file: "priv/repo/seeds.exs"
END
};

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
  my_help;
  exit 0;
fi
args="$@"
/opt/app/bin/<%= app %> eval <%= "#{Macro.camelize(app)}.ReleaseTasks.seed(~w($args))"%>
