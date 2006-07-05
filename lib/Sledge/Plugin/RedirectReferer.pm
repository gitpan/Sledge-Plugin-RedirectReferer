package Sledge::Plugin::RedirectReferer;

use warnings;
use strict;

our $VERSION = '0.02';

sub import {
    my $self = shift;
    my $pkg  = caller;

    no strict 'refs';
    *{"$pkg\::redirect_referer"} = sub {
        my ($self , $url) = @_;
        if ( $self->r->header_in('Referer') ) {
            return $self->redirect($self->r->header_in('Referer'));
        } else {
            return $self->redirect($url);
        }
    };
}

=head1 NAME

Sledge::Plugin::RedirectReferer - referer redirect plugin for Sledge

=head1 VERSION

This documentation refers to Sledge::Plugin::RedirectReferer version 0.02

=head1 SYNOPSIS

    package Your::Pages;
    use Sledge::Plugin::RedirectReferer;

    sub dispatch_index {
        my $self = shift;
        return $self->redirect_referer('/if/non/referer');
    }

=head1 METHODS

=head2 redirect_referer

    This method redirect referer.

=head1 AUTHOR

Atsushi Kobayashi, C<< <nekokak at gmail> >>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-sledge-plugin-redirectreferer at rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Sledge-Plugin-RedirectReferer>.
I will be notified, and then you'll automatically be notified of progress on
your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Sledge::Plugin::RedirectReferer

You can also look for information at:

=over 4

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Sledge-Plugin-RedirectReferer>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Sledge-Plugin-RedirectReferer>

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Sledge-Plugin-RedirectReferer>

=item * Search CPAN

L<http://search.cpan.org/dist/Sledge-Plugin-RedirectReferer>

=back

=head1 ACKNOWLEDGEMENTS

=head1 COPYRIGHT & LICENSE

Copyright 2006 Atsushi Kobayashi, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1; # End of Sledge::Plugin::RedirectReferer
