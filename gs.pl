#!/usr/bin/env perl
use Mojolicious::Lite;
use Net::WebSocket::Server;
use threads;

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

get '/commit/:commitid' => sub {
	my $self = shift;
	my $commitid = $self->stash('commitid');
	my $result = [];

	$result = `git show $commitid`;
	$self->res->headers->header('Access-Control-Allow-Origin' => '*');
	$self->render(text => $result);
};

my $gs = `git status`;

# returns true value when status has changed from last time
sub updateStatus {
	my $newgs = `git status`;
	if ($gs ne $newgs) {
		$gs = $newgs;
		return 0;
	}
	return 1;
};

async {Net::WebSocket::Server->new(
	listen => 3001,
	tick_period => 60,
	# periodically send status if it has changed from last time
	on_tick => sub {
		my ($serv) = @_;
		if (updateStatus()) {
			print "Updating status due to local change\n";
			$_->send_utf8($gs) for $serv->connections;
		}
	},
	on_connect => sub {
		my ($serv, $conn) = @_;
		$conn->on(
			utf8 => sub {
				my ($conn, $msg) = @_;
				if ($msg eq "status") {
					print "Call for status\n";
					updateStatus();
					$conn->send_utf8($gs);
				}
			}
		);
	}
)->start};

app->start;
