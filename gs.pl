#!/usr/bin/env perl
use Mojolicious::Lite;

get '/commits' => sub {
	my $self = shift;
	my $result = [];
	my $rawout = `git log --format="format:%ad, %an, %s"`;
	my @commits = split /\n/, $rawout;
	foreach my $commit (@commits) {
		(my $ts, my $author, my $msg) = ($commit =~ /([^,]*), ([^,]*), ([^,]*)/);
		push $result, {
			time => $ts,
			author => $author,
			msg => $msg
		}
	}

	$self->render(json => $result);
};

app->start;
