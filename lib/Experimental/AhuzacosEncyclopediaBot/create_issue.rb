      old_output = File.read("_feed/old_feed.txt")

      # Get the date.
      system("date '+%Y %d %m' > _date/date.txt")

      # Immutables
      date             = File.read("_date/date.txt").strip
      date_title       = date.tr " ", "_"

      channel_description = File.read("_posts/input.txt").strip

      File.open("_documents/#{date_title}.txt", "w") { |f|
        f.puts channel_description
      }

      new_output = "
  <item>
    <title>#{date}</title>
    <link>http://localhost:8000/documents/#{date_title}.txt</link>
    <description><![CDATA[#{channel_description}]]></description>
  </item>
      "

      open("_feed/old_feed.txt", "w") { |f|
        f.puts new_output
      }

      generate_xml = "<?xml version='1.0' encoding='UTF-8' ?>
<?xml-stylesheet type='text/css' href='Stylesheet/rss.css' ?>
<rss version='2.0'>

<channel>
  <title>Rubymixer Feed</title>
  <link>http://localhost:8000/_routines/_feed/feed.xml</link>
  <description>Subscription feed for Rubymixer.</description>

  #{new_output}
  #{old_output}
</channel>

</rss>"

      open("_feed/feed.xml", "w") { |f|
        f.puts generate_xml
      }
