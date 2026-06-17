Return-Path: <linux-doc+bounces-92696-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lnM2Goo0M2qa+QUAu9opvQ
	(envelope-from <linux-doc+bounces-92696-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 01:58:02 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D226C69CD7B
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 01:58:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=rcpassos.me header.s=purelymail1 header.b=drOgPepI;
	dkim=pass header.d=purelymail.com header.s=purelymail1 header.b=sNYQW9Wd;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92696-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92696-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=rcpassos.me;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A2BF3069C98
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 23:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 920422C1788;
	Wed, 17 Jun 2026 23:57:59 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339692BE63F
	for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 23:57:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781740679; cv=none; b=l34Oz5HKYZwiY19f3o/kLq1sDVSMNQvvfj0U2R9z/QVwB0duomYUBqen+qrtnXMZTis+XAXxGM84vddwXxjT5sptr5EwU0ldaMfJ2SE2ky8qFBFddlCg/w/av+xHb03O8ok48DdTsZ1xRwls9pnlopgotm7Z0sRH8wSBxUhNFrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781740679; c=relaxed/simple;
	bh=uONPstQ4d6oDyxpvMnrFgUw5bKhUN3do8K+jqvn+XLY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qkHJTxL3xS+1g/khjwOjrnxcn3YG/Zjt8cxIfE3/ZKU/oYgcmRbBr8XVK6Oh+WtNhkym/Q5OFogJLtReXF/Fgy5jvSwOJlraWGNz/xvVhxOcu50mwCsf5c0ikQwKHJgpaDtWebcLZNRPv2Gs0w6o0lbKS80t7npr2UZzh1EjYyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rcpassos.me; spf=pass smtp.mailfrom=rcpassos.me; dkim=pass (2048-bit key) header.d=rcpassos.me header.i=@rcpassos.me header.b=drOgPepI; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=sNYQW9Wd; arc=none smtp.client-ip=34.202.193.197
DKIM-Signature: a=rsa-sha256; b=drOgPepISOhSApwkGZSLNy4wC+Mru5P5YFr875bZJGsPoNaANtw6VgtTA/KVWibiKZtS76KxySzTSa5aOFORHW9eIUmcgg+o1YpXlQE8lW0BWlvDSbjK3bkZSaSlr+6jFqYAgKozD1sprDeCE9tm43vtaEC1zlfxlKoB8fxgiJxzvG3/sZxWwW8EXcqCU9MzLZmblv10GYiaMSzIau400U3AoEg4KkvfatbtPbfxP87iU9B+9sPzJ6oLpnIO69yqow2I+KDdqZdOrD9kf6x1ZdJ6kbXoQJanGi3yhWsTf6HUX8WXQ1U/xs14WhSb3FZ3wCPBBUkOVxZgR8qJBwuGuA==; s=purelymail1; d=rcpassos.me; v=1; bh=uONPstQ4d6oDyxpvMnrFgUw5bKhUN3do8K+jqvn+XLY=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=sNYQW9WdipBAaK5mC75gG6piPH4QrVTvUVFnaLdesA4CV04aEm2fz6GXTpxLNp5HzrUnUNhVCUkJnkc5+MyIgL5kopwym7f6ijqbbkpsi7xFqi6HmCXW2t7dou14o10xH+80OMH6I0XTRO7OomoTZVaaKlaojozqddplTZstJH7mVws8yrqLPa14VFf472wL+kI5lfmOu2ydizU2p1P8ow3Vrmqwec7botC04EZM30xmMEvfbH6mZtmLid/xO4w31CsLQY8NyFmb7w7MulCw/nQaR3ZagluPMFFV2koOJ0zAdC5qKSfAxYgfGtwq0FYGW2hMwng+1dDDF+RKbdnppQ==; s=purelymail1; d=purelymail.com; v=1; bh=uONPstQ4d6oDyxpvMnrFgUw5bKhUN3do8K+jqvn+XLY=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 45355:7809:null:purelymail
X-Pm-Original-To: linux-doc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -30342446;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Wed, 17 Jun 2026 23:57:50 +0000 (UTC)
From: Rafael Passos <rafael@rcpassos.me>
To: shuah@kernel.org,
	corbet@lwn.net
Cc: Rafael Passos <rafael@rcpassos.me>,
	skhan@linuxfoundation.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH] kselftest docs: remove reference to obsolete/archived wiki
Date: Wed, 17 Jun 2026 20:57:26 -0300
Message-ID: <20260617235740.74029-1-rafael@rcpassos.me>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rcpassos.me,reject];
	R_DKIM_ALLOW(-0.20)[rcpassos.me:s=purelymail1,purelymail.com:s=purelymail1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92696-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:shuah@kernel.org,m:corbet@lwn.net,m:rafael@rcpassos.me,m:skhan@linuxfoundation.org,m:linux-kselftest@vger.kernel.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rafael@rcpassos.me,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@rcpassos.me,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[rcpassos.me:+,purelymail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[purelymail.com:dkim,rcpassos.me:dkim,rcpassos.me:email,rcpassos.me:mid,rcpassos.me:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D226C69CD7B

This link in the docs point to a wiki that is no longer active.

The wiki was moved to archive.kernel.org, and there is a warning:
"OBSOLETE CONTENT This wiki has been archived and the content is
no longer updated."

Signed-off-by: Rafael Passos <rafael@rcpassos.me>
---

 Documentation/dev-tools/kselftest.rst | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tool=
s/kselftest.rst
index d7bfe320338c..64c0ec7428a2 100644
--- a/Documentation/dev-tools/kselftest.rst
+++ b/Documentation/dev-tools/kselftest.rst
@@ -15,11 +15,6 @@ able to run that test on an older kernel. Hence, it is i=
mportant to keep
 code that can still test an older kernel and make sure it skips the test
 gracefully on newer releases.
=20
-You can find additional information on Kselftest framework, how to
-write new tests using the framework on Kselftest wiki:
-
-https://kselftest.wiki.kernel.org/
-
 On some systems, hot-plug tests could hang forever waiting for cpu and
 memory to be ready to be offlined. A special hot-plug target is created
 to run the full range of hot-plug tests. In default mode, hot-plug tests r=
un
--=20
2.53.0


