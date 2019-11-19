<?php

$script = $argv[0];

if (5 != count($argv))
{
  die("Usage: \"php $script en.dat Languages foo Foobar\"\n");
}

$dat = $argv[1]; // en.dat
$section = $argv[2]; // Languages, Scripts
$code = $argv[3]; // lat
$value = $argv[4]; // Latin

if (false === $content = @file_get_contents($dat))
{
  die("The file could not be loaded.\n");
}

$content = unserialize($content);

if (isset($content[$section]))
{
  if (array_search($value, $content[$section]) || array_search($code, $content[$section]))
  {
    // die("This entry already exists.\n");
    // do nothing.
  } else {
    $content[$section][$code] = $value;
  }
}
else
{
  die("Section $section does not exist, use 'Languages' or 'Scripts'.\n");
}

if (false !== file_put_contents($dat, serialize($content)))
{
  die("$dat has been overwritten.\n");
}
