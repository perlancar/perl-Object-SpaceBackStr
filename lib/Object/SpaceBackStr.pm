package Object::SpaceBackStr;

use 5.010001;

# VERSION

use overload q{""} => sub { " \b" };

sub new { bless(\"$_[0]", $_[0]) }

1;
# ABSTRACT: Object which stringifies to space+backspace (" \b")

=for Pod::Coverage ^(new)$

=head1 SYNOPSIS

 use Object::SpaceBackStr;

 die Object::SpaceBackStr->new; # dies without seemingly printing anything


=head1 DESCRIPTION

Object::SpaceBackStr objects are like L<Object::BlankStr> and L<Object::NulStr>
objects, but stringify to space+backspace (" \b") so when printed they don't
seem to output anything.

Choosing between the three: Object::BlankStr truly doesn't print anything as it
stringifies to an empty string, but since empty strings are false in Perl it has
some gotchas (see Object::BlankStr documentation for more details).
Object::NulStr stringifies to "\0" which are also invisible in most terminals
when printed, but when it doesn't work, you can try if Object::SpaceBackStr
does.

So far the only case I've found this to be useful is for die()-ing without
seemingly printing anything. If you just use 'die;' or 'die "";' Perl will print
the default "Died at ..." message. But if you say 'die
Object::SpaceBackStr->new;' Perl will die without seemingly printing anything.


=head1 SEE ALSO

L<Object::BlankStr>

L<Object::NulStr>

=cut
