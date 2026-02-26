Return-Path: <linux-doc+bounces-77186-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDrWBu4doGmzfgQAu9opvQ
	(envelope-from <linux-doc+bounces-77186-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 26 Feb 2026 11:18:22 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BA15F1A4231
	for <lists+linux-doc@lfdr.de>; Thu, 26 Feb 2026 11:18:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D704A300917F
	for <lists+linux-doc@lfdr.de>; Thu, 26 Feb 2026 10:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17BDA39447F;
	Thu, 26 Feb 2026 10:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=airmail.cc header.i=@airmail.cc header.b="DyhVVhmJ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.cock.li (unknown [37.120.193.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6402C17A0;
	Thu, 26 Feb 2026 10:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772101029; cv=none; b=GagT+rkHrco/EXgVGP1fzXZlF4XhJeq5u+lqfP251hg5DRFZdgX7/mtbRahx+aE5PYlVg33XhReKaUh0KfBu+MV1cgMI/NDgIdJVouGl2QxQXUNDw/nM3+M8JY98NW726rnSRlLe154Vq8iFrWxhrHoXLWYbD/ZIV/J0PtIuQT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772101029; c=relaxed/simple;
	bh=t9i23lP6VZ8dPPbQp3CblRq8JE0wSJR/jIG/+ej4P9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JJpAbqPpxuPRytshlj+KYNy00XiHssrPeaXHn5VQuPa4IOaye9y3y5DqKqAGYFETXgxOLUtow/z+L7WbGRkV9tMvWdn1Hz0Mhy+mzii0xwYoFbSLW3XqP54wV1jcwdSIIzvTwX5DJ3d8O6knoz6BNa7866D31ug+rUQOjpbl54E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airmail.cc; spf=pass smtp.mailfrom=airmail.cc; dkim=pass (2048-bit key) header.d=airmail.cc header.i=@airmail.cc header.b=DyhVVhmJ; arc=none smtp.client-ip=37.120.193.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airmail.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airmail.cc
From: Hans Anda <hansa@airmail.cc>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=airmail.cc; s=mail;
	t=1772101025; bh=t9i23lP6VZ8dPPbQp3CblRq8JE0wSJR/jIG/+ej4P9k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DyhVVhmJgqEXRjsJ8IWlKFkNVOxJL7U8HpDwqlIZ2XXWunhAQFwWKWaMkSq8DuzXr
	 g0fSxHm7pb3ET1XoFBNtUGEheokmSRS2wCntYPwE72Tb+OB0gwB/Y4mxttb22x8bY6
	 oX1WQ23fQNfs3Hl8EcUt3J0nASCT1juqq7PsZyuBXFfrPruk8Od68xB4XA+0STilsC
	 bQw8KUCuqMAvzCYdeViPlJH9GQqa6wdbh2qv/0lEgExJnlC+ImKCL4hk38Ihlc9qUd
	 LphjrV+FSmmLy1Vppy1wI3Pw4alqBZN9W5lq/eB0ZSzkSNNa+f1rLeFncMNQiLJOg7
	 OkR6FMZXAJoxA==
To: Jonathan Corbet <corbet@lwn.net>,
	Collin Funk <collin.funk1@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Anda <hansa@airmail.cc>
Subject: [PATCH v2 2/2] scripts: ver_linux: expand and sort
Date: Thu, 26 Feb 2026 11:14:05 +0100
Message-ID: <20260226101404.41639-2-hansa@airmail.cc>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226100256.40215-2-hansa@airmail.cc>
References: <20260226100256.40215-2-hansa@airmail.cc>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[airmail.cc,quarantine];
	R_DKIM_ALLOW(-0.20)[airmail.cc:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[lwn.net,gmail.com,linuxfoundation.org];
	TAGGED_FROM(0.00)[bounces-77186-lists,linux-doc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansa@airmail.cc,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[airmail.cc:+];
	DM_SURBL(0.00)[airmail.cc:mid,airmail.cc:dkim,airmail.cc:email];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,airmail.cc:mid,airmail.cc:dkim,airmail.cc:email]
X-Rspamd-Queue-Id: BA15F1A4231
X-Rspamd-Action: no action

Add missing tools in ver_linux
 (bash, bc, bindgen, bindutils, btrfs, clang, e2fsck, grub2, awk, tar,
 gtags, iptables, kmod, mcelog, mkimage, openssl, pahole, python, Rust,
 sphinx, squashfs-tools, udev)
sort output alphabetically
fix path to changes.rst

Signed-off-by: Hans Anda <hansa@airmail.cc>
---
 scripts/ver_linux | 58 +++++++++++++++++++++++++++++++----------------
 1 file changed, 39 insertions(+), 19 deletions(-)

diff --git a/scripts/ver_linux b/scripts/ver_linux
index d6f2362d3792..51e632adf999 100755
--- a/scripts/ver_linux
+++ b/scripts/ver_linux
@@ -7,7 +7,7 @@
 
 BEGIN {
 	usage = "If some fields are empty or look unusual you may have an old version.\n"
-	usage = usage "Compare to the current minimal requirements in Documentation/Changes.\n"
+	usage = usage "Compare to the current minimal requirements in Documentation/process/Changes.rst\n"
 	print usage
 
 	system("uname -a")
@@ -17,37 +17,57 @@ BEGIN {
 	libc = "libc[.]so[.][0-9]+$"
 	libcpp = "(libg|stdc)[+]+[.]so([.][0-9]+)+$"
 
-	printversion("GNU C", version("gcc -dumpversion"))
-	printversion("GNU Make", version("make --version"))
+	printversion("bash", version("bash --version"))
+	printversion("bc", version("bc --version"))
+	printversion("bindgen", version("bindgen --version"))
 	printversion("Binutils", version("ld -v"))
-	printversion("Util-linux", version("mount --version"))
-	printversion("Mount", version("mount --version"))
-	printversion("Module-init-tools", version("depmod -V"))
-	printversion("E2fsprogs", version("tune2fs"))
-	printversion("Jfsutils", version("fsck.jfs -V"))
-	printversion("Xfsprogs", version("xfs_db -V"))
-	printversion("Pcmciautils", version("pccardctl -V"))
-	printversion("Pcmcia-cs", version("cardmgr -V"))
-	printversion("Quota-tools", version("quota -V"))
-	printversion("PPP", version("pppd --version"))
-	printversion("Isdn4k-utils", version("isdnctrl"))
-	printversion("Nfs-utils", version("showmount --version"))
 	printversion("Bison", version("bison --version"))
+	printversion("btrfs-progs", version("btrfs --version"))
+	printversion("Clang", version("clang --version"))
+	printversion("Console-tools", version("loadkeys -V"))
+	printversion("Dynamic linker (ldd)", version("ldd --version"))
+	printversion("E2fsprogs", version("e2fsck -V"))
 	printversion("Flex", version("flex --version"))
+	printversion("GNU AWK", version("gawk -version"))
+	printversion("GNU C", version("gcc -dumpversion"))
+	printversion("GNU make", version("make --version"))
+	printversion("GNU tar", version("tar --version"))
+	printversion("GRUB", version("grub-install --version"))
+	printversion("GRUB2", version("grub2-install --version"))
+	printversion("gtags", version("gtags --version"))
+	printversion("iptables", version("iptables -V"))
+	printversion("Isdn4k-utils", version("isdnctrl"))
+	printversion("Jfsutils", version("fsck.jfs -V"))
+	printversion("Kbd", version("loadkeys -V"))
+	printversion("kmod", version("kmod -V"))
 
 	while ("ldconfig -p 2>/dev/null" | getline > 0)
 		if ($NF ~ libc || $NF ~ libcpp)
 			if (!seen[ver = version("readlink " $NF)]++)
 				printversion("Linux C" ($NF ~ libcpp? "++" : "") " Library", ver)
 
-	printversion("Dynamic linker (ldd)", version("ldd --version"))
-	printversion("Procps", version("ps --version"))
+	printversion("mcelog", version("mcelog --version"))
+	printversion("mkimage", version("mkimage --version"))
+	printversion("Module-init-tools", version("depmod -V"))
+	printversion("Mount", version("mount --version"))
 	printversion("Net-tools", version("ifconfig --version"))
-	printversion("Kbd", version("loadkeys -V"))
-	printversion("Console-tools", version("loadkeys -V"))
+	printversion("Nfs-utils", version("showmount --version"))
+	printversion("openssl", version("openssl version"))
+	printversion("pahole", version("pahole --version"))
+	printversion("Pcmcia-cs", version("cardmgr -V"))
+	printversion("Pcmciautils", version("pccardctl -V"))
+	printversion("PPP", version("pppd --version"))
+	printversion("Procps", version("ps --version"))
+	printversion("Python", version("python3 -V"))
+	printversion("Quota-tools", version("quota -V"))
+	printversion("Rust", version("rustc --version"))
 	printversion("Sh-utils", version("expr --v"))
+	printversion("Sphinx", version("sphinx-build --version"))
+	printversion("squashfs-tools", version("mksquashfs -version"))
 	printversion("Udev", version("udevadm --version"))
+	printversion("Util-linux", version("mount --version"))
 	printversion("Wireless-tools", version("iwconfig --version"))
+	printversion("Xfsprogs", version("xfs_db -V"))
 
 	while ("sort /proc/modules" | getline > 0) {
 		mods = mods sep $1
-- 
2.53.0


