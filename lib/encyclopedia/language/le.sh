xmlstarlet sel -t -v '/screen/container/conlang/word_name'       le.xml >      language_data/word_classes/names/le.txt;   echo " ";
xmlstarlet sel -t -v '/screen/container/conlang/word_type'       le.xml >      language_data/word_classes/types/le.txt;   echo " ";
xmlstarlet sel -t -v '/screen/container/conlang/word_definitoon' le.xml > language_data/word_classes/definition/le.txt;   echo " ";
xmlstarlet sel -t -v '/screen/container/conlang/word_context'    le.xml >    language_data/word_classes/context/le.txt;   echo " ";
