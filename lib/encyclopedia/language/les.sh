xmlstarlet sel -t -v '/screen/container/conlang/word_name'       les.xml >      language_data/word_classes/names/les.txt;   echo " ";
xmlstarlet sel -t -v '/screen/container/conlang/word_type'       les.xml >      language_data/word_classes/types/les.txt;   echo " ";
xmlstarlet sel -t -v '/screen/container/conlang/word_definitoon' les.xml > language_data/word_classes/definition/les.txt;   echo " ";
xmlstarlet sel -t -v '/screen/container/conlang/word_context'    les.xml >    language_data/word_classes/context/les.txt;   echo " ";
