package CourseRecord::Web::Route;
use Mojo::Base 'Mojolicious::Controller';
use DateTime;
use JSON::XS;
use URI::Escape;

# This action will render a template
sub register {
  my $self = shift;

  my $json  = Mojo::JSON->new;

  my $dt = DateTime->now( time_zone=>'local' );
  my $name = $self->req->params("course_name");
  my $type = $self->req->params("course_type");
  my $data = uri_unescape( $self->req->params("data"));


  $self->app->log->debug($data);

  my $hash = decode_json $data;
  my $path = $hash->{"path"};
  my $distance = $hash->{"distance"};


#  $self->db->do(qq{
#        Insert into Route 
#        (g, name, create_user, create_at)
#        values
#         (GeomFromText(?), ?, ?, NOW())
#    },undef,($path, $name, 'test_user' ));

    my $route = $self->db->insert('Route',
    {g=> \["GeomFromText(?)", $path],
    type => $type,
    distance => $distance,
    name => $name, 
    create_user=> "test_user", 
    create_at => \"Now()"});


  $self->render(json=> $self->req->json);
}

1;
