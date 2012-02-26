package MT::Plugin::ImageThumbnailFilter;
use strict;
use base qw( MT::Plugin );

our $NAME = ( split /::/, __PACKAGE__ )[-1];

my $plugin = __PACKAGE__->new({
    name        => $NAME,
    id          => lc $NAME,
    key         => lc $NAME,
    l10n_class  => $NAME . '::L10N',
    versiona    => '0.01',
    author_name => 'masiuchi',
    author_link => 'https://github.com/masiuchi',
    plugin_link => 'https://github.com/masiuchi/mt-plugin-image-thumbnail-filter',
    description => '<__trans phrase="Enable filtering by image is thumbnail or not.">',
});
MT->add_plugin( $plugin );

sub init_registry {
    my ( $p ) = @_;
    my $pkg = '$'.$NAME.'::'.$NAME.'::';
    $p->registry( 'list_properties', 'asset', 'thumbnail', {
        base                  => '__virtual.single_select',
        singleton             => 1,
        label                 => 'Thumbnail Image',
        filter_tmpl           => $pkg . 'ListProps::filter_tmpl',
        single_select_options => $pkg . 'ListProps::single_select_options',
        terms                 => $pkg . 'ListProps::terms',
    } );
    $p->registry( 'system_filters', 'asset', {
        is_thumbnail     => $pkg . 'SysFilts::is_thumbnail',
        is_not_thumbnail => $pkg . 'SysFilts::is_not_thumbnail',
    } );
}

1;
__END__
