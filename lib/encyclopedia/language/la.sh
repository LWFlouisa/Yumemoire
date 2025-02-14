xmlstarlet sel -t -v '/screen/container/conlang/word_name'       la.xml >      language_data/word_classes/names/la.txt;   echo " ";
xmlstarlet sel -t -v '/screen/container/conlang/word_type'       la.xml >      language_data/word_classes/types/la.txt;   echo " ";
xmlstarlet sel -t -v '/screen/container/conlang/word_definition' la.xml > language_data/word_classes/definition/la.txt;   echo " ";
xmlstarlet sel -t -v '/screen/container/conlang/word_context'    la.xml >    language_data/word_classes/context/la.txt;   echo " ";
