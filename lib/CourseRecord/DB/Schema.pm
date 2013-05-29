package CourseRecord::DB::Schema;
use Teng::Schema::Declare;
use DateTime::Format::MySQL;

    table {
        name 'Route';
        pk id;
        columns qw( id type name distance g create_user type create_at );

        inflate 'create_at' => sub {
            DateTime::Format::MySQL->parse_datetime(shift);
        };
    #    deflate 'create_at' => sub {
    #        DateTime::Format::MySQL->format_datetime(shift);
    #    };
    };

1;
