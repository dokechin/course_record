package CourseRecord::Web;
use Mojo::Base 'Mojolicious';
use CourseRecord::DB;

# This method will run once at server start
sub startup {
  my $self = shift;

  # Documentation browser under "/perldoc"
  $self->plugin('PODRenderer');

  my $ config = $self->plugin('Config', { file => 'course_record.conf' });
  
  $self->helper(db => sub { CourseRecord::DB->new ( $config->{db} )});

  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->get('/')->to('root#index');

  $r->get('/register')->to('register#index');
  $r->post('/register')->to('register#create');
  $r->get('/register/confirm')->to('register#confirm');
  $r->post('/register/confirm')->to('register#insert');
  $r->get('/register/complete')->to('register#complete');

  $r->post('/route')->to('route#register');
  $r->get('/route')->to('route#index');
  $r->get('/search')->to('search#index');

}

1;
