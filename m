Return-Path: <linux-doc+bounces-94799-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pUvgBxqkR2oScwAAu9opvQ
	(envelope-from <linux-doc+bounces-94799-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 13:59:22 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5C37021C9
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 13:59:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=niVDhjzK;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=KyF7lq68;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94799-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-94799-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B1A3300A4F8
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 11:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 048F53CC7FF;
	Fri,  3 Jul 2026 11:59:06 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F303CC7EB;
	Fri,  3 Jul 2026 11:59:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783079945; cv=none; b=GitjhbKotAstn7q2+4GF0Xe3sNO4eYj+bKex+memq90dVpYX3vuk+g+CodwGtMNwNCrWvjJicaCu18eUEcVAAkyWga1YZHC1pMtE++HEcaNimA+OZdoZ84q9VL7S0LkQuZmFd2N1UqvHDziqFRbsNIJQ89siXLEX12rzj22VN/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783079945; c=relaxed/simple;
	bh=L7J0ROE6wLSCQByXzCGOE+AxJp0npA3yn8AEZRw0WAs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AIlV2MxXiyw08KmjjA+Cf8zZ+QrKD0mwHpfW6lnVmOQzJMoe9CZPIcyYapRnGD/B1CWqdQlhdy9lrfhGBlpXVX9i4mFQ9cWxJITQZ1QjVWqLzI1sKQpsfriMOLPLsw+p6yvlV9gJNz9zJ4uewa4/1AwoyZfYhUx4JsVGbe/t9gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=niVDhjzK; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=KyF7lq68; arc=none smtp.client-ip=80.241.56.151
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gsC2r4ZqNz8v17;
	Fri, 03 Jul 2026 13:59:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783079940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZXICK1mdeCK7VdDznnyllzaidC+uzcAfl8/1FTyycxo=;
	b=niVDhjzK1BBSGFVoC21+SDLXB18XSDDyMx/P6m+5skAjvMqS8eY5S8CBF8d0B87TNGnI+m
	NJd26ESWxGesHuFTLDSS3Ugj42UDsLLsq+aWvM7Lbrz82Zcw9f0hWCp3pOKfsnZwSma2nb
	LmVFJYQcTJsoILclVZIsAPCZiAYZ8cml+Ba0u5esJrQ/wobkSj8CryP1X3XYFQohOQJ4lf
	ywt2ICX7zqDYISDPPg1+LF1s1rmwR6Eo2rbP/wySELxwdkecJLAwqfmunuBgP2711+V0Nf
	2oJnrxOYh7vIqd6YEgPGMqHdC20ZCNdAJZXjDoTCj90cPPk6GV0TtQ1Tdqv41A==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783079939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZXICK1mdeCK7VdDznnyllzaidC+uzcAfl8/1FTyycxo=;
	b=KyF7lq68w4pta5cCxL/F3cop+7Md73QrXe0mfxZZYF04xZ7NEU6ls9drlHT8/2w5KXn5oD
	9zQAz6N53sQhOd0N3+4tRGJY3604DV2OfgDi4YGsY3RBU2Ms9lyN9EJD2JJFr/FMWoMPPz
	+X/gsRMuqPQmjho9gR0mmDwTMIHsr/f68SHZZ2jWP3Wi7yTEEZCm03rp+fS+lZWAqJv3PA
	O6KnqJiUvIloX5wBiGBbZ+2my48XDxZ43b7jS9vi6k+2cahy2tRDwDMWyWeki23YSTfHgl
	kxEyJfrtyKFSFd/v+W6odLYYH0564ESJs8rloLFW/93VPzRY5myrgGbBl1QU+Q==
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sched/Documentation: fix code
Date: Fri,  3 Jul 2026 13:51:15 +0200
Message-ID: <20260703115114.229848-3-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: jbqwno9gex6ps6tfmbz4pdte8zncy8hp
X-MBO-RS-ID: 291543d9e9cc0f66ac7
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94799-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mingo@redhat.com,m:peterz@infradead.org,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:manuelebner@mailbox.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[manuelebner@mailbox.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manuelebner@mailbox.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mailbox.org:from_mime,mailbox.org:email,mailbox.org:mid,mailbox.org:dkim,checkpatch.pl:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7E5C37021C9

checkpatch.pl returns 'trailing statements should be on next line'
for this file. Do as told.

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
This is the only checkpatch-error in all of Documentation/*/*.c
---
 Documentation/scheduler/sched-pelt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/scheduler/sched-pelt.c b/Documentation/scheduler/sched-pelt.c
index 7238b355919c..38ff53dcf352 100644
--- a/Documentation/scheduler/sched-pelt.c
+++ b/Documentation/scheduler/sched-pelt.c
@@ -25,7 +25,8 @@ void calc_runnable_avg_yN_inv(void)
 	for (i = 0; i < HALFLIFE; i++) {
 		x = ((1UL<<32)-1)*pow(y, i);
 
-		if (i % 6 == 0) printf("\n\t");
+		if (i % 6 == 0)
+			printf("\n\t");
 		printf("0x%8x, ", x);
 	}
 	printf("\n};\n\n");
-- 
2.54.0


