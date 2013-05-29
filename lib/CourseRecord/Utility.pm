package CourseRecord::Utility;
use Imager;

sub makeCheckerIcon(){

  my $km = shift;
  my $image = Imager->new(xsize => 40, ysize => 32,,channels=>4);
  
  $image->read(file=>'./public/img/jogging.png', type=>'png')
    or die "Cannot read $filename: ", $img->errstr;
      
  # use a different file, depending on the font support you have in
  # your installed Imager.
  my $font_filename = '/cygdrive/c/Windows/Fonts/Arial.ttf';
  my $font = Imager::Font->new(file=> $font_filename)
    or die "Cannot load $font_filename: ", Imager->errstr;
  
  my $text = "${km}k";
  my $text_size = 12;
  
  $font->align(string => $text,
               size => $text_size,
               color => 'white',
               x => $image->getwidth/2,
               y => $image->getheight/2,
               halign => 'center',
               valign => 'center',
               image => $image);
  
  $image->write(file=>"./public/img/km/${km}km_icon.png")
      or die 'Cannot save tutorial2.ppm: ', $image->errstr;
}

1;      