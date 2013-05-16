package CourseRecord::Web::Route;
use Mojo::Base 'Mojolicious::Controller';
use DateTime;

# This action will render a template
sub register {
  my $self = shift;

  my $dt = DateTime->now( time_zone=>'local' );
  my $name = $self->req->json->{"name"};
  my $type = $self->req->json->{"type"};
  my $distance = $self->req->json->{"distance"};
  my $path = $self->req->json->{"path"};
  $self->app->log->debug($name);
  $self->app->log->debug($path);

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


  $self->render_json($self->req->json);
}

1;
