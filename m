Return-Path: <linux-doc+bounces-32132-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B729E5E1C
	for <lists+linux-doc@lfdr.de>; Thu,  5 Dec 2024 19:16:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6597016B790
	for <lists+linux-doc@lfdr.de>; Thu,  5 Dec 2024 18:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F0522579A;
	Thu,  5 Dec 2024 18:16:56 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAD321D591
	for <linux-doc@vger.kernel.org>; Thu,  5 Dec 2024 18:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733422616; cv=none; b=oG/otEuIATbd8HvLkWK+1CwkmVIIWRGLczG6GptB5j3rGd+znN5N6VEC1wINs15FziBhXp+KbXt1PLZuqah1K6SL80qIQnFHYi7JsqU9DlgzlxihNrKB4JGIKSNBwgMgxor+dSIMvLInEi+pvLt3QxX4dl+JVMXWQYaCkr9ogko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733422616; c=relaxed/simple;
	bh=tOE7FoZbj2of2iSrM9k6O7Bi5zwn703dH6gxug1gaGk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cXr06Co7TihqP/EtYOuCUyqo9GaFYoFWj9v0EJqc/W3XJ0mBpjIqeCjCyG52L2AN9l5WsYcixZ3muwKgIFHaozO9xL2bgaCi8YraHS9mzOSBY7j4SBiJJsOk33ntRtYW2J7G7YjaKBlw5+gpYVM24jO3g79QIXEh0Y0e0hwgtKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b16a:6561:fa1:2b32])
	by michel.telenet-ops.be with cmsmtp
	id l6Gf2D00D3EEtj2066Gf3k; Thu, 05 Dec 2024 19:16:46 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tJGP0-000LwV-9e;
	Thu, 05 Dec 2024 19:16:39 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tJGP1-00EUTT-16;
	Thu, 05 Dec 2024 19:16:39 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Joe Perches <joe@perches.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Andy Whitcroft <apw@canonical.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@corigine.com>,
	Simon Horman <horms@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Cc: Junio C Hamano <gitster@pobox.com>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/2] Align git commit ID abbreviation guidelines and checks
Date: Thu,  5 Dec 2024 19:16:34 +0100
Message-Id: <1c244040bf6ce304656e31036e5178b4b9dfb719.1733421037.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733421037.git.geert+renesas@glider.be>
References: <cover.1733421037.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The guidelines for git commit ID abbreviation are inconsistent: some
places state to use 12 characters exactly, while other places recommend
12 characters or more.  The same issue is present in the checkpatch.pl
script.

E.g. Documentation/dev-tools/checkpatch.rst says:

  **GIT_COMMIT_ID**
    The proper way to reference a commit id is:
    commit <12+ chars of sha1> ("<title line>")

However, scripts/checkpatch.pl has two different checks: one warning
check accepting 12 characters exactly:

    # Check Fixes: styles is correct
    Please use correct Fixes: style 'Fixes: <12 chars of sha1> (\"<title line>\")'

and a second error check accepting 12-40 characters:

    # Check for git id commit length and improperly formed commit descriptions
    # A correctly formed commit description is:
    #    commit <SHA-1 hash length 12+ chars> ("Complete commit subject")
    Please use git commit description style 'commit <12+ chars of sha1>

Hence patches containing commit IDs with more than 12 characters are
flagged by checkpatch, and sometimes rejected by maintainers or
reviewers.  This is becoming more important with the growth of the
repository, as git may decide to use more characters in case of local
conflicts.

Fix this by settling on at least 12 characters, in both the
documentation and in the checkpatch.pl script.

Fixes: bd17e036b495bebb ("checkpatch: warn for non-standard fixes tag style")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Rebase on top of commit 2f07b652384969f5 ("checkpatch: always parse
    orig_commit in fixes tag") in v6.13-rc1,
  - Update documentation, too.
---
 Documentation/process/maintainer-tip.rst     | 2 +-
 Documentation/process/submitting-patches.rst | 8 ++++----
 scripts/checkpatch.pl                        | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/process/maintainer-tip.rst b/Documentation/process/maintainer-tip.rst
index e374b67b3277ac54..41d5855700cd4f83 100644
--- a/Documentation/process/maintainer-tip.rst
+++ b/Documentation/process/maintainer-tip.rst
@@ -270,7 +270,7 @@ Ordering of commit tags
 To have a uniform view of the commit tags, the tip maintainers use the
 following tag ordering scheme:
 
- - Fixes: 12char-SHA1 ("sub/sys: Original subject line")
+ - Fixes: 12+char-SHA1 ("sub/sys: Original subject line")
 
    A Fixes tag should be added even for changes which do not need to be
    backported to stable kernels, i.e. when addressing a recently introduced
diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 1518bd57adab501f..f3508b5aa4ebab96 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -143,10 +143,10 @@ also track such tags and take certain actions. Private bug trackers and
 invalid URLs are forbidden.
 
 If your patch fixes a bug in a specific commit, e.g. you found an issue using
-``git bisect``, please use the 'Fixes:' tag with the first 12 characters of
-the SHA-1 ID, and the one line summary.  Do not split the tag across multiple
-lines, tags are exempt from the "wrap at 75 columns" rule in order to simplify
-parsing scripts.  For example::
+``git bisect``, please use the 'Fixes:' tag with at least the first 12
+characters of the SHA-1 ID, and the one line summary.  Do not split the tag
+across multiple lines, tags are exempt from the "wrap at 75 columns" rule in
+order to simplify parsing scripts.  For example::
 
 	Fixes: 54a4f0239f2e ("KVM: MMU: make kvm_mmu_zap_page() return the number of pages it actually freed")
 
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index dbb9c3c6fe30f906..5b57f0306a50046d 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3230,7 +3230,7 @@ sub process {
 			my $tag_case = not ($tag eq "Fixes:");
 			my $tag_space = not ($line =~ /^fixes:? [0-9a-f]{5,40} ($balanced_parens)/i);
 
-			my $id_length = not ($orig_commit =~ /^[0-9a-f]{12}$/i);
+			my $id_length = not ($orig_commit =~ /^[0-9a-f]{12,40}$/i);
 			my $id_case = not ($orig_commit !~ /[A-F]/);
 
 			my $id = "0123456789ab";
@@ -3240,7 +3240,7 @@ sub process {
 			if ($ctitle ne $title || $tag_case || $tag_space ||
 			    $id_length || $id_case || !$title_has_quotes) {
 				if (WARN("BAD_FIXES_TAG",
-				     "Please use correct Fixes: style 'Fixes: <12 chars of sha1> (\"<title line>\")' - ie: 'Fixes: $cid (\"$ctitle\")'\n" . $herecurr) &&
+				     "Please use correct Fixes: style 'Fixes: <12+ chars of sha1> (\"<title line>\")' - ie: 'Fixes: $cid (\"$ctitle\")'\n" . $herecurr) &&
 				    $fix) {
 					$fixed[$fixlinenr] = "Fixes: $cid (\"$ctitle\")";
 				}
-- 
2.34.1


