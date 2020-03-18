#  [dmn]: md2htm.rb: convert markdown to html
#
# Intended primarily to make html from github wiki pages
# with tables. It's impossible to get rid of the right sidebar
# there - it takes up a lot of horizontal space, and tables
# therefore are displayed shrinked.
#
# requires:
# 1) textproc/rubygem-github-markup
# 2) gem install commonmarker


require 'github/markup'
require 'commonmarker'


argc = ARGV.length
$stderr.printf( " >> argc: [%d]\n", argc )

ifile = ""
ofile = ""
title = ""

if argc == 2 then
    ifile = ARGV[0]
    ofile = ARGV[1]
else
    $stderr.printf( " >> ERR: argc != 2\n" )
    $stderr.printf( " >>   usage: md2htm <ifile.md> <ofile.html>\n" )
    exit 1
end

$stderr.printf( " >> ifile: [%s]\n", ifile )
$stderr.printf( " >> ofile: [%s]\n", ofile )

title = File.basename( ifile, ".md" )
$stderr.printf( " >> title: [%s]\n", title )


fd = File.open( ofile, "w" )

fd.printf( "%s\n", "<!DOCTYPE html><html><head><meta charset=\"UTF-8\" />" )
fd.printf( "<title>%s</title>\n", title )
fd.printf( "%s\n", "<style>" )
fd.printf( "%s\n", "table { border-style: solid; border-width: 1px; border-spacing: 0; }" )
fd.printf( "%s\n", "th    { background-color: lightgray; border-style: solid; border-width: 1px; border-color: gray; padding: 5px; }" )
fd.printf( "%s\n", "tr,td { border-style: solid; border-width: 1px; border-color: gray; padding: 5px; }" )
fd.printf( "%s\n", "code  { background-color: lightgray; }" )
fd.printf( "%s\n", "</style>" )
fd.printf( "%s\n", "</head><body>" )


# fd.printf( "%s\n", CommonMarker.render_html( File.read(ifile),
                                             # [:UNSAFE, :GITHUB_PRE_LANG, :TABLE_PREFER_STYLE_ATTRIBUTES] ) )
                                             # [:DEFAULT] ) )

# fd.printf( "%s\n", GitHub::Markup.render( ifile, File.read(ifile), options: [:UNSAFE, :GITHUB_PRE_LANG] ) )
fd.printf( "%s\n", GitHub::Markup.render( ifile, File.read(ifile) ) )

fd.printf( "%s\n", "</body></html>" )

fd.close

