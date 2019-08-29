#!/bin/bash
function my_help () {
# Using a here doc with standard out.
cat <<-END
Usage:
------
   -h | --help
     Display this help
   -n NUMBER | --step NUMBER
     Runs the specific number of migrations
   --to VERSION
     Runs all until the supplied version is reached
   --all
     Runs all available if true
------
If no options provided, it will run all available migrations.
END
};

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
  my_help;
  exit 0;
fi

args="$@"
/opt/app/bin/<%= app %> eval <%= "#{Macro.camelize(app)}.ReleaseTasks.migrate(~w($args))"%>
