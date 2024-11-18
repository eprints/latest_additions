#Rendering Viewss
{
package EPrints::Script::Compiled;
use strict;

sub run_people_with_views
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
                        #not first item (or only one item)
                        if( $i == $#$creators )
                        {
                                #last item
                                $r->appendChild( $session->make_text( " and " ) );
                        }
                        else
                        {
                                $r->appendChild( $session->make_text( "," ) );
                       }
                }
               my $email = $creator->{id};
               my $person_span;
               my $name_bold;
               my @creators_name = ( $creator->{name}->{family}, $creator->{name}->{given},  $creator->{name}->{lineage},  $creator->{name}->{honourific} );
               my $browse_link_id = join( ":", map { URI::Escape::uri_escape($_, ":%") } @creators_name );
               my $browse_link_url = $session->config( "http_url" ) . "/view/creators/" . EPrints::Utils::escape_filename( $browse_link_id ) .".html";
               my $browse_link = $session->render_link ( $browse_link_url );
               $browse_link->appendChild( $session->render_name( $creator->{name} ) );

               if( defined $email && $email =~ m/\@sunderland\.ac\.uk$/ )
               {
                        $name_bold = $session->make_element( "span", "style" => "font-weight:bold" );
                        $person_span = $session->make_element( "span", "class" => "person" );
                        $person_span->appendChild( $name_bold );
                        $name_bold->appendChild( $browse_link);
               }
                else {
                        $person_span = $session->make_element( "span", "class" => "person" );
                        $person_span->appendChild( $browse_link );
                }
                push @browse_links, $browse_link;
                $r->appendChild( $person_span );
        }
        return [ $r, "XHTML" ];
}

}
