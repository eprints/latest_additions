#Rendering Views
{
package EPrints::Script::Compiled;
use strict;

sub run_display_first_authorname
{
        my( $self, $state, $value ) = @_;

        my $session = $state->{session};
        my $r = $state->{session}->make_doc_fragment;

        my $creators = $value->[0];
        my @browse_links;
        my $creator = @$creators[0];
        $r->appendChild( $session->make_element( "br" ) );
               my $email = $creator->{id};
               my $person_span;
               my $name_bold;
               my @creators_name = ( $creator->{name}->{family}, $creator->{name}->{given},  $creator->{name}->{lineage},  $creator->{name}->{honourific} );
               my $browse_link_id = join( ":", map { URI::Escape::uri_escape($_, ":%") } @creators_name );
               my $browse_link_url = $session->config( "http_url" ) . "/view/creators/" . EPrints::Utils::escape_filename( $browse_link_id ) .".html";
               my $browse_link = $session->render_link ( $browse_link_url );
               $browse_link->appendChild( $session->render_name( $creator->{name} ) );
               $person_span = $session->make_element( "span", "class" => "person" );
               $person_span->appendChild( $browse_link );
               $r->appendChild( $person_span );
        return [ $r, "XHTML" ];
}

sub run_authorname_with_link
{
        my( $self, $state, $value ) = @_;

        my $session = $state->{session};
        my $r = $state->{session}->make_doc_fragment;

        my $creators = $value->[0];
        my @browse_links;
        foreach my $i (0..$#$creators)
        {
                my $creator = @$creators[$i];
                if( $i > 0 )
                {
                         $r->appendChild( $session->make_element( "br" ) );
                }
               my $email = $creator->{id};
               my $person_span;
               my $name_bold;
               my @creators_name = ( $creator->{name}->{family}, $creator->{name}->{given},  $creator->{name}->{lineage},  $creator->{name}->{honourific} );
               my $browse_link_id = join( ":", map { URI::Escape::uri_escape($_, ":%") } @creators_name );
               my $browse_link_url = $session->config( "http_url" ) . "/view/creators/" . EPrints::Utils::escape_filename( $browse_link_id ) .".html";
               my $browse_link = $session->render_link ( $browse_link_url );
               $browse_link->appendChild( $session->render_name( $creator->{name} ) );

               $person_span = $session->make_element( "span", "class" => "person" );
               $person_span->appendChild( $browse_link );

                $r->appendChild( $person_span );
        }
        return [ $r, "XHTML" ];
}
}
