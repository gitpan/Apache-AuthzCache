# $Id: Makefile.PL,v 1.1 2000/09/26 20:11:50 cgilmore Exp $

use strict;
use Config qw(%Config);
use ExtUtils::MakeMaker;

WriteMakefile 
  (
   'NAME'         => 'Apache::AuthzCache',
   'VERSION_FROM' => 'AuthzCache.pm',
   'PREREQ_PM'    => { 'Apache' => '1.24', 'IPC::Cache' => '0.02', 
		       'String::ParseWords' => '0.1' },
   'dist'         => { 'COMPRESS' => 'gzip -9f', 'SUFFIX' => 'gz', },
  );
