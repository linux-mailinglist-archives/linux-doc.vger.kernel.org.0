Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDEC5415FD8
	for <lists+linux-doc@lfdr.de>; Thu, 23 Sep 2021 15:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241435AbhIWNbz (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 23 Sep 2021 09:31:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:44098 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241224AbhIWNbq (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 23 Sep 2021 09:31:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BD3CF6126A;
        Thu, 23 Sep 2021 13:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632403814;
        bh=GfTG4NevTekER0PTzKJU9hfUyfF7/nFfc5ACOcb887E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nrXBUe+SWZjuRn7FRHxODDjRJk/ysp0Qyr5Xy0+vqdIKxhJ41YDvCx3Q5VYEnaM9F
         BMbSB+WYbWAnvb4uqzUuuyjOhSpULMoFsEgIyZs6fHCuPQ4ZresRU8iB+s3kSyHdLV
         01hdVRY/jSRcuI12GgE56qnfQFxOJzl0IaFHjNsK7xJJL8iSgjqxBrlA3HMokzaXlw
         d5yfHpxY7bluKJ4zQy2vKCB9GXYXGbqSjHKlWlE7NJjlM3vBCswpVGVVQWouE9sAxs
         GLs/S4wAhvb/PcI/xZlsAodgDarLGMHuWXQTIbAH1A0tXFAkPz/1FQnLN2v2x1CQZg
         PqhMhP9ODSkNQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mTOnk-000nds-OW; Thu, 23 Sep 2021 15:30:12 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>,
        Tony Luck <tony.luck@intel.com>, Yonghong Song <yhs@fb.com>,
        bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH 02/13] scripts: get_abi.pl: Check for missing symbols at the ABI specs
Date:   Thu, 23 Sep 2021 15:30:00 +0200
Message-Id: <8612c609e77b1b057172ab13685bdfd3ce37995f.1632402570.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1632402570.git.mchehab+huawei@kernel.org>
References: <cover.1632402570.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Check for the symbols that exists under /sys but aren't
defined at Documentation/ABI.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/get_abi.pl | 90 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 88 insertions(+), 2 deletions(-)

diff --git a/scripts/get_abi.pl b/scripts/get_abi.pl
index 48077feea89c..e714bf75f5c2 100755
--- a/scripts/get_abi.pl
+++ b/scripts/get_abi.pl
@@ -13,7 +13,9 @@ my $help = 0;
 my $man = 0;
 my $debug = 0;
 my $enable_lineno = 0;
+my $show_warnings = 1;
 my $prefix="Documentation/ABI";
+my $sysfs_prefix="/sys";
 
 #
 # If true, assumes that the description is formatted with ReST
@@ -36,7 +38,7 @@ pod2usage(2) if (scalar @ARGV < 1 || @ARGV > 2);
 
 my ($cmd, $arg) = @ARGV;
 
-pod2usage(2) if ($cmd ne "search" && $cmd ne "rest" && $cmd ne "validate");
+pod2usage(2) if ($cmd ne "search" && $cmd ne "rest" && $cmd ne "validate" && $cmd ne "undefined");
 pod2usage(2) if ($cmd eq "search" && !$arg);
 
 require Data::Dumper if ($debug);
@@ -50,6 +52,8 @@ my %symbols;
 sub parse_error($$$$) {
 	my ($file, $ln, $msg, $data) = @_;
 
+	return if (!$show_warnings);
+
 	$data =~ s/\s+$/\n/;
 
 	print STDERR "Warning: file $file#$ln:\n\t$msg";
@@ -522,11 +526,88 @@ sub search_symbols {
 	}
 }
 
+# Exclude /sys/kernel/debug and /sys/kernel/tracing from the search path
+sub skip_debugfs {
+	if (($File::Find::dir =~ m,^/sys/kernel,)) {
+		return grep {!/(debug|tracing)/ } @_;
+	}
+
+	if (($File::Find::dir =~ m,^/sys/fs,)) {
+		return grep {!/(pstore|bpf|fuse)/ } @_;
+	}
+
+	return @_
+}
+
+my %leaf;
+
+my $escape_symbols = qr { ([\x01-\x08\x0e-\x1f\x21-\x29\x2b-\x2d\x3a-\x40\x7b-\xff]) }x;
+sub parse_existing_sysfs {
+	my $file = $File::Find::name;
+
+	my $mode = (stat($file))[2];
+	return if ($mode & S_IFDIR);
+
+	my $leave = $file;
+	$leave =~ s,.*/,,;
+
+	if (defined($leaf{$leave})) {
+		# FIXME: need to check if the path makes sense
+		my $what = $leaf{$leave};
+
+		$what =~ s/,/ /g;
+
+		$what =~ s/\<[^\>]+\>/.*/g;
+		$what =~ s/\{[^\}]+\}/.*/g;
+		$what =~ s/\[[^\]]+\]/.*/g;
+		$what =~ s,/\.\.\./,/.*/,g;
+		$what =~ s,/\*/,/.*/,g;
+
+		$what =~ s/\s+/ /g;
+
+		# Escape all other symbols
+		$what =~ s/$escape_symbols/\\$1/g;
+
+		foreach my $i (split / /,$what) {
+			if ($file =~ m#^$i$#) {
+#				print "$file: $i: OK!\n";
+				return;
+			}
+		}
+
+		print "$file: $leave is defined at $what\n";
+
+		return;
+	}
+
+	print "$file not found.\n";
+}
+
+sub undefined_symbols {
+	foreach my $w (sort keys %data) {
+		foreach my $what (split /\xac /,$w) {
+			my $leave = $what;
+			$leave =~ s,.*/,,;
+
+			if (defined($leaf{$leave})) {
+				$leaf{$leave} .= " " . $what;
+			} else {
+				$leaf{$leave} = $what;
+			}
+		}
+	}
+
+	find({wanted =>\&parse_existing_sysfs, preprocess =>\&skip_debugfs, no_chdir => 1}, $sysfs_prefix);
+}
+
 # Ensure that the prefix will always end with a slash
 # While this is not needed for find, it makes the patch nicer
 # with --enable-lineno
 $prefix =~ s,/?$,/,;
 
+if ($cmd eq "undefined" || $cmd eq "search") {
+	$show_warnings = 0;
+}
 #
 # Parses all ABI files located at $prefix dir
 #
@@ -537,7 +618,9 @@ print STDERR Data::Dumper->Dump([\%data], [qw(*data)]) if ($debug);
 #
 # Handles the command
 #
-if ($cmd eq "search") {
+if ($cmd eq "undefined") {
+	undefined_symbols;
+} elsif ($cmd eq "search") {
 	search_symbols;
 } else {
 	if ($cmd eq "rest") {
@@ -576,6 +659,9 @@ B<rest>                  - output the ABI in ReST markup language
 
 B<validate>              - validate the ABI contents
 
+B<undefined>             - existing symbols at the system that aren't
+                           defined at Documentation/ABI
+
 =back
 
 =head1 OPTIONS
-- 
2.31.1

