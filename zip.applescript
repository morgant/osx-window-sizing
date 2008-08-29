-- Originally from http://www.macosxhints.com/article.php?query=droplet&story=20040923120629702
on open (theItems)
    try
      tell application "Finder"
        --repeat the command to compress each item as an individual archive
        repeat with oneItem in theItems
          --used to extract the name and location of the file
          set itemProp to properties of oneItem
          --where the file is
          set itemPath to quoted form of POSIX path of oneItem
          --where the compressed file should end up
          set destFold to quoted form of POSIX path of (container of itemProp as alias)
          --what the name of the file is
          set itemName to name of oneItem
          --do it asynchronously
          do shell script ("cd " & destFold & " && zip -r " & itemName & ".zip " & itemName & " &")
        end repeat
        -- Go back to Finder
        activate
      end tell
    on error errmsg
      --should anything go wrong let the user know
      display dialog errmsg
    end try
end open
