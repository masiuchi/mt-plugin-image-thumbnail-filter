package ImageThumbnailFilter::ListProps;
use strict;

use MT::Asset::Image;

our $NAME   = ( split /::/, __PACKAGE__ )[0];
our $PLUGIN = MT->instance()->component( $NAME );

sub filter_tmpl {
    my $image = MT->translate( 'Image' );
    return <<"HTMLHEREDOC";
<mt:setvar name="label" value="$image">
<mt:var name="filter_form_single_select">
HTMLHEREDOC
}

sub single_select_options {
    return [
        {
            label => $PLUGIN->translate( 'is thumbnail' ),
            value => 'is_thumbnail',
        },
        {
            label => $PLUGIN->translate( 'is not thumbnail' ),
            value => 'is_not_thumbnail',
        },
    ];
}

sub terms {
    my $prop = shift;
    my ( $args, $db_terms, $db_args ) = @_;

    my $terms = { class => 'image', };
    my $value = $args->{value};
    if ( $value eq 'is_thumbnail' ) {
        $terms->{parent} = \'is not null';
    } elsif ( $value eq 'is_not_thumbnail' ) {
        $terms->{parent} = \'is null';
    } else {
        return {};
    }

    return $terms;
}

1;
__END__
