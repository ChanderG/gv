#!/usr/bin/env perl
use Mojolicious::Lite;

get '/commits' => sub {
	my $self = shift;

	my $result = [];
	my $rawout = `git log --format="format:%ad, %an, %s, %H"`;
	my @commits = split /\n/, $rawout;
	foreach my $commit (@commits) {
		(my $ts, my $author, my $msg, my $hash) = ($commit =~ /([^,]*), ([^,]*), ([^,]*), ([^,]*)/);
		push $result, {
			time => $ts,
			author => $author,
			msg => $msg,
			hash => $hash
		}
	}

	$self->res->headers->header('Access-Control-Allow-Origin' => '*');
	$self->render(json => $result);
};

app->start;
