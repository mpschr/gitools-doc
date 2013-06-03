for f in ./*.rtf
do
	filename=$(basename "$f")
	extension="${filename##*.}"
	filename="${filename%.*}"
	ext=".rst"
	out=$filename$ext
	textutil -convert html -stdout $f | pandoc -f html -t rst --no-wrap | sed "s/'>/>/g" | sed 's/http.*bin\/view\/\(.*\)\/\([A-Za-z0-9]\{1,\}\)/\1_\2.rst/g' | grep -v "\*\*\*\*"  | grep -v superadmin | grep -v -E "^[0-9]{4}/"  > ../${out}
done
