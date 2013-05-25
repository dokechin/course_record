package CourseRecord::Utility;
use Imager;

sub makeCheckerIcon(){

         print "Has truetype"      if $Imager::formats{tt};
         print "Has t1 postscript" if $Imager::formats{t1};
         print "Has Win32 fonts"   if $Imager::formats{w32};
         print "Has Freetype2"     if $Imager::formats{ft2};

  my $image = Imager->new(xsize => 32, ysize => 37);
  
  $image->box(xmin => 0, ymin => 0, xmax => 32, ymax => 37,
              filled => 1, color => 'blue');
  
  # use a different file, depending on the font support you have in
  # your installed Imager.
  my $font_filename = '/cygdrive/c/Windows/Fonts/Arial.ttf';
  my $font = Imager::Font->new(file=> $font_filename)
    or die "Cannot load $font_filename: ", Imager->errstr;
  
  my $text = "1km";
  my $text_size = 12;
  
  $font->align(string => $text,
               size => $text_size,
               color => 'red',
               x => $image->getwidth/2,
               y => $image->getheight/2,
               halign => 'center',
               valign => 'center',
               image => $image);
  
  $image->write(file=>'icon.png')
      or die 'Cannot save tutorial2.ppm: ', $image->errstr;
}

1;      