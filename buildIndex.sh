HEAD="
<!doctype html>
<html>
<head>
<meta charset='utf-8'>
<title>Index</title>
</head>
<body>
<header>
</header>
";
TAIL="
</body>
</html>
";
echo $HEAD
EXAMPLELINKS=`find ./examples | grep .html`;
for l in $EXAMPLELINKS
do
    echo "<br><a href='$l'>$l</a>";
done
echo $TAIL
