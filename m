Return-Path: <linux-doc+bounces-92276-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gaaZHKbnLWoDmgQAu9opvQ
	(envelope-from <linux-doc+bounces-92276-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 14 Jun 2026 01:28:38 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA3A68009C
	for <lists+linux-doc@lfdr.de>; Sun, 14 Jun 2026 01:28:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=qSteVIZw;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92276-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92276-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55C46300FEE1
	for <lists+linux-doc@lfdr.de>; Sat, 13 Jun 2026 23:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B9E439768C;
	Sat, 13 Jun 2026 23:28:35 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553373822A5
	for <linux-doc@vger.kernel.org>; Sat, 13 Jun 2026 23:28:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781393315; cv=none; b=RByyRB4ctnABp+8ODLEDz/25b+aQGttswaLo051pYZmYizRWb83wuglGHyOC1ORjpJPlx9UKH9WEMcf7nynzxK+xQohCTXEanMC201GPkx25chXHnQsOusWBfiXJDErxp5LJTTLFoWbpiVqXvbTxyTg8vttECgBMrwGAohUaVnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781393315; c=relaxed/simple;
	bh=/V+oEILKx/Lzli+MpHnzgkO8YbwX6Skih2zsBDPEXMY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Iq2I4rByph9Ex5Fq6GRF7KM8G9BWx6BcEY7Ql0nuFL2gfz8yWWczDWhFXBxBVJsup5qSoGll6Pj2R1dOvosxx2aI8Gt7Vb+UglaH7fAxApbrJV3BQWrukgm/alLc1/Tniosv9Rndp6Cs+EjNn5D9BoIlel82+49YDa00uK1thKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qSteVIZw; arc=none smtp.client-ip=74.125.82.194
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-3078e0dcd67so2414773eec.0
        for <linux-doc@vger.kernel.org>; Sat, 13 Jun 2026 16:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781393313; x=1781998113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WgPAND3Xg5aNuvMPGBlXEs+pI9ZCxyG9L+4QLg1/iFg=;
        b=qSteVIZw2o0mmmYKZ9pvb5BjWvgnKcuS+olbhKMMmo6xjxh+V1fLSfS3vgov5ExVur
         OooPlFX+K0Zbg5I2vLfN6VbqlWMBskPATGRNHOeqjx5d+N1BQs95pg7fNYtw0xlLCmcv
         NT2ya4WntZgfnf7jtxot0i9cATIh4OWDQe2QURcIwEXIT72mL/YFJUFUoa1sn2DG0QyJ
         vOzlQZXncD2ey3ykrzRsbJpT4aHBkcGenmal+1u3Lm3DEC1y1SX4mJj3rWSrKVz4EY8o
         VZGEevfCX6rX9EzF5eX/hn9cxa6S8BKzIFqTQZmrdRvkfk8QPaQa0ce1mfJ4BjGMcOwO
         sO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781393313; x=1781998113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WgPAND3Xg5aNuvMPGBlXEs+pI9ZCxyG9L+4QLg1/iFg=;
        b=by6MYKN5uZ0FDyEJMcL731B4sajJyCEIUXJAjhJWs0SFhrHV42R77KEDrNoRPdE8KX
         1khAO1YUAEY+ZJO+cya9RpWPm5tQVhsuoQ3boQfoy+T2iNH0MF6P1VZ+mw10ANw7OWcl
         iLhW0CJOgnUSBZ/TBLTzo9vXoAjHPfmyj86WBwCTrK2+KEDTLRmL2/RQwxRjXJkMlKBy
         eQz2i0cRdKZX2wphks+xmxWsBEKPyC1b37KkrSvqkywrIpeVS0bNP4pxpRZ0PV7CKnzR
         KVpaCtQzuLGIvSIokgDCJ26BTN1t/ggrZP1YiyFvBaFYxy+PLCtx7+f7viWpkNbwSdhW
         Uahg==
X-Forwarded-Encrypted: i=1; AFNElJ8qjfX06Z986xLUx5nQ8Dz0z4/Pm+C2DDi6hoNDAYkehyqc3F02Z7xWUTuTCM+GaBhBuS8TEdkkQIY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrn9gQdfL6zOnYoM8Qa2aP+N9bQM+BNn8WoHWZVs3dSv+DF04F
	2R8TXyS8dr1XJidR6nn0O/M1HBFX1mLyFouv4t7rSMLahA37YONDdWot
X-Gm-Gg: Acq92OEA6nuLrMIxnV1su74VHYkIX8+zR43QzpVoT2Syj+GV1Q7DT9IIaorD5IezH8Q
	/ZoZ7qlRzuzxvTA67c+hWtbh/+DM+iALfcPbXme6VjjDm+11RYGEagQuf5SIy2c8W8S83PSQPzY
	BThgIqWRC2DVnnj27J+5ExU4AQ1AG0lhjtVtfrBkXJSbRaVdoJWl3e6RCNCRbcQymthQagbsZpX
	uEkSh9cbHvcDgevjg+Kx6Ag5I7D9vLeR7aad5dH6EEgXly7S7LBElouNyfdKlxakuvbEmO1c7Fc
	IdDdm37ffUryZm401nKEPItn6fcthUv81xqh5mOBkw4QWnFZrKMMhNrU1Bw0gOoeUgi6HP6/DMj
	CEWNQPJzoQqF/AkW/Q3TgOhNInB8K24Cy60rx3SR6bKIj/vjOGCQ1bnZ2X1FHV6LOIqbDsOdIde
	jUXXDA3t8X8Wn741Qnugzy7BFYKgPHAjlSDB4W4ixmMRTgozhDK79xlyqC8Xt+D5ejLNsX44w4+
	qRju0nBQSMLs2+0vVQrLuHNo6UYry+Lgf/Ukotco+KRWMGqvfQrRIq10Tuy/DQCcPaeTWv3dNsx
	8U09wUi6ajk2/qeUbA==
X-Received: by 2002:a05:7300:642a:b0:2da:a813:a5fd with SMTP id 5a478bee46e88-3093bf08f59mr2726519eec.22.1781393313361;
        Sat, 13 Jun 2026 16:28:33 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e4898c0sm9430028eec.3.2026.06.13.16.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 16:28:33 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>,
	Chen Pei <cp0613@linux.alibaba.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Subject: [PATCH] docs: kbuild: remove ISDN references in Makefile examples
Date: Sat, 13 Jun 2026 16:28:27 -0700
Message-ID: <20260613232830.147116-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-92276-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:skhan@linuxfoundation.org,m:cp0613@linux.alibaba.com,m:rdunlap@infradead.org,m:corbet@lwn.net,m:enelsonmoore@gmail.com,m:linux-kbuild@vger.kernel.org,m:linux-doc@vger.kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,linux.alibaba.com,infradead.org,lwn.net,gmail.com,vger.kernel.org];
	FORGED_SENDER(0.00)[enelsonmoore@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BDA3A68009C

Documentation/kbuild/makefiles.rst uses some extracts from now-removed
ISDN code as examples. While they are harmless, they appeared in my
checks for CONFIG_* symbols referenced but not defined in the kernel.
Replace them with generic examples.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 Documentation/kbuild/makefiles.rst | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index 24a4708d26e8..dfac8c9611f4 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -127,11 +127,8 @@ controllers are detected, and thus your disks are renumbered.
 
 Example::
 
-  #drivers/isdn/i4l/Makefile
-  # Makefile for the kernel ISDN subsystem and device drivers.
-  # Each configuration option enables a list of files.
-  obj-$(CONFIG_ISDN_I4L)         += isdn.o
-  obj-$(CONFIG_ISDN_PPP_BSDCOMP) += isdn_bsdcomp.o
+  obj-$(CONFIG_FOO) += foo.o
+  obj-$(CONFIG_BAR) += bar.o
 
 Loadable module goals - obj-m
 -----------------------------
@@ -145,10 +142,9 @@ simply adds the file to $(obj-m).
 
 Example::
 
-  #drivers/isdn/i4l/Makefile
-  obj-$(CONFIG_ISDN_PPP_BSDCOMP) += isdn_bsdcomp.o
+  obj-$(CONFIG_FOO) += foo.o
 
-Note: In this example $(CONFIG_ISDN_PPP_BSDCOMP) evaluates to "m"
+Note: In this example $(CONFIG_FOO) evaluates to "m".
 
 If a kernel module is built from several source files, you specify
 that you want to build a module in the same way as above; however,
@@ -158,13 +154,12 @@ variable.
 
 Example::
 
-  #drivers/isdn/i4l/Makefile
-  obj-$(CONFIG_ISDN_I4L) += isdn.o
-  isdn-y := isdn_net_lib.o isdn_v110.o isdn_common.o
+  obj-$(CONFIG_FOO) += foo.o
+  foo-y := foo_1.o foo_2.o foo_3.o
 
-In this example, the module name will be isdn.o. Kbuild will
-compile the objects listed in $(isdn-y) and then run
-``$(LD) -r`` on the list of these files to generate isdn.o.
+In this example, the module name will be foo.o. Kbuild will
+compile the objects listed in $(foo-y) and then run
+``$(LD) -r`` on the list of these files to generate foo.o.
 
 Due to kbuild recognizing $(<module_name>-y) for composite objects,
 you can use the value of a ``CONFIG_`` symbol to optionally include an
-- 
2.43.0


