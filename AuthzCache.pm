# $Id: AuthzCache.pm,v 1.5 2000/09/26 20:11:50 cgilmore Exp $
#
# Author          : Christian Gilmore
# Created On      : Fri Jun 23 10:15:36 CDT 2000
# Status          : Functional
# 
# PURPOSE
#    Group Authorization Cache
#
###############################################################################
#
# IBM Public License Version 1.0 
# 
# THE ACCOMPANYING PROGRAM IS PROVIDED UNDER THE TERMS OF THIS IBM
# PUBLIC LICENSE ("AGREEMENT"). ANY USE, REPRODUCTION OR
# DISTRIBUTION OF THE PROGRAM CONSTITUTES RECIPIENT'S ACCEPTANCE OF
# THIS AGREEMENT.
# 
# 1. DEFINITIONS 
# 
# "Contribution" means: 
# 
#   a) in the case of International Business Machines Corporation 
#   ("IBM"), the Original Program, and 
# 
#   b) in the case of each Contributor, 
# 
#   i) changes to the Program, and
# 
#   ii) additions to the Program;
# 
#   where such changes and/or additions to the Program originate from
#   and are distributed by that particular Contributor. A Contribution 
#   'originates' from a Contributor if it was added to the Program by 
#   such Contributor itself or anyone acting on such Contributor's 
#   behalf. Contributions do not include additions to the Program 
#   which: (i) are separate modules of software distributed in
#   conjunction with the Program under their own license agreement, 
#   and (ii) are not derivative works of the Program.
# 
# "Contributor" means IBM and any other entity that distributes the
# Program.
# 
# "Licensed Patents " mean patent claims licensable by a Contributor 
# which are necessarily infringed by the use or sale of its 
# Contribution alone or when combined with the Program. 
# 
# "Original Program" means the original version of the software 
# accompanying this Agreement as released by IBM, including source 
# code, object code and documentation, if any. 
# 
# "Program" means the Original Program and Contributions. 
# 
# "Recipient" means anyone who receives the Program under this 
# Agreement, including all Contributors. 
# 
# 2. GRANT OF RIGHTS 
# 
#   a) Subject to the terms of this Agreement, each Contributor hereby 
#   grants Recipient a non-exclusive, worldwide, royalty-free 
#   copyright license to reproduce, prepare derivative works of, 
#   publicly display, publicly perform, distribute and sublicense the 
#   Contribution of such Contributor, if any, and such derivative 
#   works, in source code and object code form.
# 
#   b) Subject to the terms of this Agreement, each Contributor hereby 
#   grants Recipient a non-exclusive, worldwide, royalty-free patent 
#   license under Licensed Patents to make, use, sell, offer to sell, 
#   import and otherwise transfer the Contribution of such 
#   Contributor, if any, in source code and object code form. This 
#   patent license shall apply to the combination of the Contribution 
#   and the Program if, at the time the Contribution is added by the 
#   Contributor, such addition of the Contribution causes such 
#   combination to be covered by the Licensed Patents. The patent 
#   license shall not apply to any other combinations which include 
#   the Contribution. No hardware per se is licensed hereunder. 
# 
#   c) Recipient understands that although each Contributor grants the 
#   licenses to its Contributions set forth herein, no assurances are 
#   provided by any Contributor that the Program does not infringe the 
#   patent or other intellectual property rights of any other entity. 
#   Each Contributor disclaims any liability to Recipient for claims 
#   brought by any other entity based on infringement of intellectual 
#   property rights or otherwise. As a condition to exercising the 
#   rights and licenses granted hereunder, each Recipient hereby 
#   assumes sole responsibility to secure any other intellectual 
#   property rights needed, if any. For example, if a third party 
#   patent license is required to allow Recipient to distribute the 
#   Program, it is Recipient's responsibility to acquire that license 
#   before distributing the Program.
# 
#   d) Each Contributor represents that to its knowledge it has 
#   sufficient copyright rights in its Contribution, if any, to grant 
#   the copyright license set forth in this Agreement. 
# 
# 3. REQUIREMENTS 
# 
# A Contributor may choose to distribute the Program in object code 
# form under its own license agreement, provided that: 
# 
#   a) it complies with the terms and conditions of this Agreement; 
#
# and
# 
#   b) its license agreement:
# 
#   i) effectively disclaims on behalf of all Contributors all 
#   warranties and conditions, express and implied, including 
#   warranties or conditions of title and non-infringement, and 
#   implied warranties or conditions of merchantability and fitness 
#   for a particular purpose; 
# 
#   ii) effectively excludes on behalf of all Contributors all 
#   liability for damages, including direct, indirect, special, 
#   incidental and consequential damages, such as lost profits; 
#   iii) states that any provisions which differ from this Agreement 
#   are offered by that Contributor alone and not by any other party; 
#   and
# 
#   iv) states that source code for the Program is available from such 
#   Contributor, and informs licensees how to obtain it in a 
#   reasonable manner on or through a medium customarily used for 
#   software exchange. 
# 
# When the Program is made available in source code form: 
# 
#   a) it must be made available under this Agreement; and 
# 
#   b) a copy of this Agreement must be included with each copy of the 
#   Program. 
# 
# Each Contributor must include the following in a conspicuous 
# location in the Program: 
# 
#   Copyright � {date here}, International Business Machines 
#   Corporation and others. All Rights Reserved. 
# 
# In addition, each Contributor must identify itself as the originator 
# of its Contribution, if any, in a manner that reasonably allows 
# subsequent Recipients to identify the originator of the 
# Contribution. 
# 
# 4. COMMERCIAL DISTRIBUTION 
# 
# Commercial distributors of software may accept certain 
# responsibilities with respect to end users, business partners and 
# the like. While this license is intended to facilitate the 
# commercial use of the Program, the Contributor who includes the 
# Program in a commercial product offering should do so in a manner 
# which does not create potential liability for other Contributors. 
# Therefore, if a Contributor includes the Program in a commercial 
# product offering, such Contributor ("Commercial Contributor") hereby 
# agrees to defend and indemnify every other Contributor ("Indemnified 
# Contributor") against any losses, damages and costs (collectively 
# "Losses") arising from claims, lawsuits and other legal actions 
# brought by a third party against the Indemnified Contributor to the 
# extent caused by the acts or omissions of such Commercial 
# Contributor in connection with its distribution of the Program in a 
# commercial product offering. The obligations in this section do not 
# apply to any claims or Losses relating to any actual or alleged 
# intellectual property infringement. In order to qualify, an 
# Indemnified Contributor must: a) promptly notify the Commercial 
# Contributor in writing of such claim, and b) allow the Commercial 
# Contributor to control, and cooperate with the Commercial 
# Contributor in, the defense and any related settlement negotiations. 
# The Indemnified Contributor may participate in any such claim at its 
# own expense. 
# 
# For example, a Contributor might include the Program in a commercial 
# product offering, Product X. That Contributor is then a Commercial 
# Contributor. If that Commercial Contributor then makes performance 
# claims, or offers warranties related to Product X, those performance 
# claims and warranties are such Commercial Contributor's 
# responsibility alone. Under this section, the Commercial Contributor 
# would have to defend claims against the other Contributors related 
# to those performance claims and warranties, and if a court requires 
# any other Contributor to pay any damages as a result, the Commercial 
# Contributor must pay those damages. 
# 
# 5. NO WARRANTY 
# 
# EXCEPT AS EXPRESSLY SET FORTH IN THIS AGREEMENT, THE PROGRAM IS 
# PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF 
# ANY KIND, EITHER EXPRESS OR IMPLIED INCLUDING, WITHOUT LIMITATION, 
# ANY WARRANTIES OR CONDITIONS OF TITLE, NON-INFRINGEMENT, 
# MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE. Each Recipient 
# is solely responsible for determining the appropriateness of using 
# and distributing the Program and assumes all risks associated with 
# its exercise of rights under this Agreement, including but not 
# limited to the risks and costs of program errors, compliance with 
# applicable laws, damage to or loss of data, programs or equipment, 
# and unavailability or interruption of operations. 
# 
# 6. DISCLAIMER OF LIABILITY 
# 
# EXCEPT AS EXPRESSLY SET FORTH IN THIS AGREEMENT, NEITHER RECIPIENT 
# NOR ANY CONTRIBUTORS SHALL HAVE ANY LIABILITY FOR ANY DIRECT, 
# INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES 
# (INCLUDING WITHOUT LIMITATION LOST PROFITS), HOWEVER CAUSED AND ON 
# ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR 
# TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF 
# THE USE OR DISTRIBUTION OF THE PROGRAM OR THE EXERCISE OF ANY RIGHTS 
# GRANTED HEREUNDER, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH 
# DAMAGES. 
# 
# 7. GENERAL 
# 
# If any provision of this Agreement is invalid or unenforceable under 
# applicable law, it shall not affect the validity or enforceability 
# of the remainder of the terms of this Agreement, and without further 
# action by the parties hereto, such provision shall be reformed to 
# the minimum extent necessary to make such provision valid and 
# enforceable. 
# 
# If Recipient institutes patent litigation against a Contributor with 
# respect to a patent applicable to software (including a cross-claim 
# or counterclaim in a lawsuit), then any patent licenses granted by 
# that Contributor to such Recipient under this Agreement shall 
# terminate as of the date such litigation is filed. In addition, If 
# Recipient institutes patent litigation against any entity (including 
# a cross-claim or counterclaim in a lawsuit) alleging that the 
# Program itself (excluding combinations of the Program with other 
# software or hardware) infringes such Recipient's patent(s), then 
# such Recipient's rights granted under Section 2(b) shall terminate 
# as of the date such litigation is filed. 
# 
# All Recipient's rights under this Agreement shall terminate if it 
# fails to comply with any of the material terms or conditions of this 
# Agreement and does not cure such failure in a reasonable period of 
# time after becoming aware of such noncompliance. If all Recipient's 
# rights under this Agreement terminate, Recipient agrees to cease use 
# and distribution of the Program as soon as reasonably practicable. 
# However, Recipient's obligations under this Agreement and any 
# licenses granted by Recipient relating to the Program shall continue 
# and survive. 
# 
# IBM may publish new versions (including revisions) of this Agreement 
# from time to time. Each new version of the Agreement will be given a 
# distinguishing version number. The Program (including Contributions) 
# may always be distributed subject to the version of the Agreement 
# under which it was received. In addition, after a new version of the 
# Agreement is published, Contributor may elect to distribute the 
# Program (including its Contributions) under the new version. No one 
# other than IBM has the right to modify this Agreement. Except as 
# expressly stated in Sections 2(a) and 2(b) above, Recipient receives 
# no rights or licenses to the intellectual property of any 
# Contributor under this Agreement, whether expressly, by implication, 
# estoppel or otherwise. All rights in the Program not expressly 
# granted under this Agreement are reserved. 
# 
# This Agreement is governed by the laws of the State of New York and 
# the intellectual property laws of the United States of America. No 
# party to this Agreement will bring a legal action under this 
# Agreement more than one year after the cause of action arose. Each 
# party waives its rights to a jury trial in any resulting litigation. 
#
###############################################################################


# Package name
package Apache::AuthzCache;


# Required libraries
use strict;
use Apache::Constants qw(OK AUTH_REQUIRED DECLINED DONE);
use IPC::Cache;
use String::ParseWords;


# Global variables
$Apache::AuthzCache::VERSION = '0.02';


###############################################################################
###############################################################################
# handler: hook into Apache/mod_perl API
###############################################################################
###############################################################################
sub handler {
  my $r = shift;
  return OK unless $r->is_initial_req; # only the first internal request
  my $requires = $r->requires;
  return OK unless $requires;
  my $require_groups = undef;

  # Get configuration
  my $casesensitive = $r->dir_config('AuthzCache_CaseSensitive') || 'on';
  my $cache_timeout = $r->dir_config('AuthzCache_Timeout');
  my $auth_name = $r->auth_name;

  # Get username
  my $user_sent = $r->connection->user;
  $r->log->debug("handler: username=$user_sent");

  # Clear for paranoid security precautions
  $r->subprocess_env(REMOTE_GROUP => undef);
  $r->notes('AuthzCache' => undef);
  
  # Get required groups
  for my $req (@$requires) {
    my ($require, $rest) = split /\s+/, $req->{requirement}, 2;
    if ($require eq "user") { return OK 
                                if grep $user_sent eq $_, split /\s+/, $rest } 
    elsif ($require eq "valid-user") { return OK }
    elsif ($require eq 'group') {
      $require_groups = String::ParseWords::parse($rest);
    }
  }

  # Do we want Windows-like case-insensitivity?
  if ($casesensitive eq 'off') {
    $user_sent = lc($user_sent);
  }

  # Create the cache if needed
  my $cache = IPC::Cache->new({ namespace => 'AuthGroups' });
  my $user_groups = $cache->get($user_sent);

  # Is the user in the cache
  if ($user_groups) {
    $r->log->debug("handler: using cached groups for $user_sent");

    foreach my $req_group (@$require_groups) {
      foreach my $user_group (@$user_groups) {
	$r->log->debug("handler: comparing $req_group to $user_group");
	if ($casesensitive eq 'off' &&
	    lc($req_group) eq lc($user_group)) {
	  # Password matches so end stage
	  $r->log->debug("handler: user in cache and case-insensitive ",
			 "groups $req_group and $user_group match; ",
			 "returning OK and setting environment and notes");
	  # I should be able to use the below lines and be done with it.
	  # Since set_handlers() and lookup_uri() don't work properly
	  # (IMO), I have to work around it by cobbling together cheat
	  # sheets for the subsequent handlers in this phase. I get the
	  # willies about the security implications in a general
	  # environment where you might be using someone else's handlers
	  # upstream or downstream...
	  # $r->log->debug("handler: user in cache and case-insensitive ",
	  # 		   "groups $req_group and $user_group match; ",
	  #		   "returning OK and clearing PerlAuthzHandler");
	  # $r->set_handlers(PerlAuthzHandler => undef);

	  $r->subprocess_env(REMOTE_GROUP => $user_group);
	  $r->notes('AuthzCache' => 'hit');
	  return OK;
	}
	elsif ($req_group eq $user_group) {
	  # Password matches so end stage
	  $r->log->debug("handler: user in cache and case-insensitive ",
			 "groups $req_group and $user_group match; ",
			 "returning OK and setting environment and notes");
	  # I should be able to use the below lines and be done with it.
	  # Since set_handlers() and lookup_uri() don't work properly
	  # (IMO), I have to work around it by cobbling together cheat
	  # sheets for the subsequent handlers in this phase. I get the
	  # willies about the security implications in a general
	  # environment where you might be using someone else's handlers
	  # upstream or downstream...
	  # $r->log->debug("handler: user in cache and case-insensitive ",
	  # 		   "groups $req_group and $user_group match; ",
	  #		   "returning OK and clearing PerlAuthzHandler");
	  # $r->set_handlers(PerlAuthzHandler => undef);
	  $r->subprocess_env(REMOTE_GROUP => $user_group);
	  $r->notes('AuthzCache' => 'hit');
	  return OK;
	}
      }
    }
  }
  
  # User not in cache
  $r->log->debug("handler: user/group not in cache; returning DECLINED");
  return DECLINED;
}

###############################################################################
###############################################################################
# manage_cache: insert new entries into the cache
###############################################################################
###############################################################################
sub manage_cache {
  my $r = shift;
  return OK unless $r->is_initial_req; # only the first internal request

  # Get username and group
  my $user_sent = $r->connection->user;
  my $group_sent = $r->subprocess_env("REMOTE_GROUP");
  $r->log->debug("manage_cache: username=$user_sent, group=$group_sent");

  # The below test is dubious. I'm putting it in as a hack around the 
  # problems with set_handlers not working quite right and lookup_uri() 
  # not refilling the stack for subrequests
  my $cache_result = $r->notes('AuthzCache');
  if ($group_sent && $cache_result eq 'hit') {
    $r->log->debug("manage_cache: upstream cache hit for ",
		   "username=$user_sent, group=$group_sent");
    return OK;
  }

  # Get configuration
  my $casesensitive = $r->dir_config('AuthzCache_CaseSensitive') || 'on';
  my $cache_timeout = $r->dir_config('AuthzCache_Timeout');
  my $auth_name = $r->auth_name;

  # Do we want Windows-like case-insensitivity?
  if ($casesensitive eq 'off') {
    $user_sent = lc($user_sent);
    $group_sent = lc($group_sent);
  }

  # Add the user to the cache
  my $cache = IPC::Cache->new({ namespace => 'AuthGroups' });
  my $user_groups = $cache->get($user_sent);
  $cache->set($user_sent, [($group_sent, $user_groups)], $cache_timeout);
  $r->log->debug("manage_cache: added $user_sent:$group_sent to the cache");

  return OK;
}

1;

__END__

# Documentation - try 'pod2text AuthzCache'

=head1 NAME

Apache::AuthzCache - mod_perl Cache Authorization Module

=head1 SYNOPSIS

 <Directory /foo/bar>
 # Authorization Realm and Type (only Basic supported)
 AuthName "Foo Bar Authentication"
 AuthType Basic

 # Any of the following variables can be set.
 # Defaults are listed to the right.
 PerlSetVar AuthzCache_CaseSensitive Off       # Default: On
 PerlSetVar AuthzCache_Timeout       60        # Default: Empty String ("")

 PerlAuthzHandler Apache::AuthzCache <Primary Authorization Module> Apache::AuthzCache::manage_cache

 require group "My Group" GroupA "Group B"     # Authorize user against
                                               # multiple groups
 </Directory>

=head1 DESCRIPTION

B<Apache::AuthzCache> is designed to work with a mod_perl
authorization module to provide caching of group membership for
site users. For a list of mod_perl authorization modules see:

http://www.cpan.org/modules/by-module/Apache/apache-modlist.html

When a request that requires authorization is received,
Apache::AuthzCache looks up the REMOTE_USER in a shared-memory
cache (using IPC::Cache) and compares the list of groups in the
cache against the groups enumerated within the "require"
configuration directive. If a match is found, the handler returns
OK and clears the downstream Authz handlers from the
stack. Otherwise, it returns DECLINED and allows the next
PerlAuthzHandler in the chain to be called.

After the primary authorization handler completes with an OK,
Apache::AuthzCache::manage_cache adds the new group (listed in
REMOTE_GROUP) to the cache.

=head1 CONFIGURATION OPTIONS

The following variables can be defined within the configuration
of Directory, Location, or Files blocks or within .htaccess
files.

=over 4

=item B<AuthzCache_CaseSensitive>

If this directive is set to 'Off', group matches will be case
insensitive.

=back

=over 4

=item B<AuthzCache_Timeout>

The time with which a user's entry within the cache will remain,
measured in minutes.

=back

=head1 NOTES

This module requires that the primary authorization handler set
the REMOTE_GROUP environment variable with the group to which the
user successfully was authorized.

This module also has a workaround to the bugs in the
set_handlers() method of mod_perl versions prior to 1.26. If
mod_perl-1.26 or higher is detected, AuthzCache will use
set_handlers to clear the downstream Authz handlers from the
stack. Otherwise, it will write notes to downstream handlers.

At the time of publication, the only primary authorization
handler established to both set the REMOTE_GROUP and read the
notes left by AuthzCache is Apache::AuthzLDAP.

=head1 AUTHORS

Christian Gilmore <cgilmore@tivoli.com>

=head1 See ALSO

httpd(8)

=head1 COPYRIGHT

Copyright (C) 2000, International Business Machines Corporation
and others. All Rights Reserved.

This module is free software; you can redistribute it and/or
modify it under the terms of the IBM Public License.

=cut

###############################################################################
###############################################################################
#
# $Log: AuthzCache.pm,v $
# Revision 1.5  2000/09/26 20:11:50  cgilmore
# namespace to Apache from Tivoli. Added pod.
#
# Revision 1.4  2000/08/26 15:35:44  cgilmore
# moved group parsing to String::ParseWords
#
# Revision 1.3  2000/07/13 19:09:28  cgilmore
# attempted to correct overwriting previously cached group (array growth)
#
# Revision 1.2  2000/07/12 18:32:07  cgilmore
# Finally found a hack (using r->notes) around bugs in set_handlers()
# and lookup_uri(). See files for more.
#
# Revision 1.1  2000/06/23 20:53:10  cgilmore
# Initial revision
#
###############################################################################
###############################################################################
