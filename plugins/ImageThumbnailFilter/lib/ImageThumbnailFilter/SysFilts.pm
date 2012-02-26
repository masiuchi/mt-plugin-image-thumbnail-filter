package ImageThumbnailFilter::SysFilts;
use strict;

sub is_thumbnail {
    return {
        label => 'Thumbnail Images',
        items => [ {
            type => 'thumbnail',
            args => {
                value => 'is_thumbnail',
            },
        } ],
        order => 20100,
    };
}

sub is_not_thumbnail {
    return {
        label => 'Not Thumbnail Images',
        items => [ {
            type => 'thumbnail',
            args => {
                value => 'is_not_thumbnail',
            },
        } ],
        order => 20200,
    };
}

1;
__END__
