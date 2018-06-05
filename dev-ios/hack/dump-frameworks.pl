#!/usr/bin/perl
#
# 24 November 2008
# Framework Dumping utility; requires class-dump
#
# Usage
# 1. Install class-dump : http://stevenygard.com/projects/class-dump/
# 1.1 注意：https://www.jianshu.com/p/213ebfecb28a
 
use strict;
 
use Cwd;
use File::Path;
 
my $HOME = (getpwuid($<))[7] || $ENV{'HOME'} 
  or die"Could not find your home directory!";
 
# This command must be in your path.
# http://www.codethecode.com/projects/class-dump/
my $CLASS_DUMP = 'class-dump'; 
 
# Public Frameworks
# dump_frameworks('/Users/f7/Downloads', 'Frameworks');
 
# Private Frameworks
dump_frameworks('/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS11.2.sdk/System/Library/Frameworks', 'Frameworks');
 
sub dump_frameworks
{
  my($dir, $subdir) = @_;
 
  opendir(my $dirh, $dir) or die"Could not opendir($dir) - $!";
 
  # Iterate through each framework found in the directory
  foreach my $file (grep { /\.framework$/ } readdir($dirh))
  {
    # Extract the framework name
    (my $fname = $file) =~ s/\.framework$//;
    print"Framework: $fname\n";
 
    my $headers_dir = "$HOME/Headers/$subdir/$fname";
 
    # Create the folder to store the headers
    mkpath($headers_dir);
 
    # Perform the class-dump
    my $cwd = cwd();
    chdir($headers_dir) or die"Could not chdir($headers_dir) - $!";
 
    system($CLASS_DUMP, '-H', "$dir/$file");
   
   if($? == -1)
    {
      die"Could not execute $CLASS_DUMP - $!\n";
    }
    
    chdir($cwd) or die"Could not chdir($cwd) - $!";
  }
}
