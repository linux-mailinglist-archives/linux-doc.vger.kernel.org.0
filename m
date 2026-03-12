Return-Path: <linux-doc+bounces-79152-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hO+iCr5Ks2lAUQAAu9opvQ
	(envelope-from <linux-doc+bounces-79152-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 13 Mar 2026 00:22:38 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 730A127B3C8
	for <lists+linux-doc@lfdr.de>; Fri, 13 Mar 2026 00:22:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6745C3039EFF
	for <lists+linux-doc@lfdr.de>; Thu, 12 Mar 2026 23:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22AB43B636B;
	Thu, 12 Mar 2026 23:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oIyjnkWO"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAFB39C013;
	Thu, 12 Mar 2026 23:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773357754; cv=none; b=HKEEDulgbnxD68AL2V7r+7Jiq09O3McBUPTaVNoEfOJxw3t6bXmYDh/ZpfV7N0DQkW3Lu9KMT4o2GfqVXpw842y9lfFvPmXkxGaPLe5TrdwYJ1NnGqsX8zxLTt6ZGdHVCnVvjGob4QQHIQ20W+HXXJq1QvnNBlkJXsVo2upWtrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773357754; c=relaxed/simple;
	bh=eWuXaoMzdNBHWhbv2FBD2M6er0YUT2LHSrUYqdGHcfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=omBWFgiILDSWGLrAfYNPV6/9/42GBtjHGSXE2gl3ZS7vVZMd3YF0jqddln4NLysjmtgur0BXgAlo645tHMHuiI6IPm4ho3znnDuxhS1RPv6QpUeOGJL9+zmUlLy4gjOx1W7EtDLBp+UVYnVW3bsD1yFw9yPIxHUrwgq15M293vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oIyjnkWO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AFBBEC19425;
	Thu, 12 Mar 2026 23:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773357753;
	bh=eWuXaoMzdNBHWhbv2FBD2M6er0YUT2LHSrUYqdGHcfQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oIyjnkWO2pJtzQIrdUe/necxKUbRa31Q2D5jwuGUsmxaUndAShtSmB/NfD9Kom62Q
	 8T4pPEif7fpPC2UltLchbw8jHmtwh1r9UcjXWordGmSljSyOuE+XWInKIxC4EHQmmn
	 1eZ0SDXpply/9YzNFmdSTJIrYvFmYQ8n3rM0kTScK3FPgtGxrKygVVvFt323hHW0qZ
	 jRhiwK+05voRwARbtNwLHPkHMcta/K+1ahosbuap0A0K1uu79pxEh5O99GOolMaZgo
	 VrDNP+3khJOk6SWadeqtH8RMH7U+Sy/PyjsPMiD/CGbm4fo0Z8eUwKZao/TwF4jJjo
	 jPRy/7QIJ0/xA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1ACC106ACFB;
	Thu, 12 Mar 2026 23:22:33 +0000 (UTC)
From: Mayank Rungta via B4 Relay <devnull+mrungta.google.com@kernel.org>
Date: Thu, 12 Mar 2026 16:22:03 -0700
Subject: [PATCH v2 2/5] watchdog: Update saved interrupts during check
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-hardlockup-watchdog-fixes-v2-2-45bd8a0cc7ed@google.com>
References: <20260312-hardlockup-watchdog-fixes-v2-0-45bd8a0cc7ed@google.com>
In-Reply-To: <20260312-hardlockup-watchdog-fixes-v2-0-45bd8a0cc7ed@google.com>
To: Petr Mladek <pmladek@suse.com>, Jinchao Wang <wangjinchao600@gmail.com>, 
 Yunhui Cui <cuiyunhui@bytedance.com>, Stephane Eranian <eranian@google.com>, 
 Ian Rogers <irogers@google.com>, Li Huafei <lihuafei1@huawei.com>, 
 Feng Tang <feng.tang@linux.alibaba.com>, 
 Max Kellermann <max.kellermann@ionos.com>, Jonathan Corbet <corbet@lwn.net>, 
 Douglas Anderson <dianders@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Florian Delizy <fdelizy@google.com>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Mayank Rungta <mrungta@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773357752; l=2486;
 i=mrungta@google.com; s=20260212; h=from:subject:message-id;
 bh=M8TFUUsd+x02qNZV27ER4ewjfXgDz4uo0zb2OpCd5AY=;
 b=c1BEltI1CYPBMfFHi5jcw831jLPMgod4QJfhUT9xrFyjz3NldwgfjwNdNDMWxW2HPjQ0sE4J1
 AmprlHBsxMWCOna15znVCFqclrRZKFGioExw5mgmR06dtLbmlgCbqf9
X-Developer-Key: i=mrungta@google.com; a=ed25519;
 pk=2Bjwbv/ibL10QnyvK9G7DoKpffXy7z6+M4NawEYgYDI=
X-Endpoint-Received: by B4 Relay for mrungta@google.com/20260212 with
 auth_id=634
X-Original-From: Mayank Rungta <mrungta@google.com>
Reply-To: mrungta@google.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-79152-lists,linux-doc=lfdr.de,mrungta.google.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[suse.com,gmail.com,bytedance.com,google.com,huawei.com,linux.alibaba.com,ionos.com,lwn.net,chromium.org,linux-foundation.org,linuxfoundation.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[mrungta@google.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-doc@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 730A127B3C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mayank Rungta <mrungta@google.com>

Currently, arch_touch_nmi_watchdog() causes an early return that
skips updating hrtimer_interrupts_saved. This leads to stale
comparisons and delayed lockup detection.

I found this issue because in our system the serial console is fairly
chatty. For example, the 8250 console driver frequently calls
touch_nmi_watchdog() via console_write(). If a CPU locks up after a
timer interrupt but before next watchdog check, we see the following
sequence:

  * watchdog_hardlockup_check() saves counter (e.g., 1000)
  * Timer runs and updates the counter (1001)
  * touch_nmi_watchdog() is called
  * CPU locks up
  * 10s pass: check() notices touch, returns early, skips update
  * 10s pass: check() saves counter (1001)
  * 10s pass: check() finally detects lockup

This delays detection to 30 seconds. With this fix, we detect the
lockup in 20 seconds.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Mayank Rungta <mrungta@google.com>
---
 kernel/watchdog.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 4c5b47495745..431c540bd035 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -159,21 +159,28 @@ void watchdog_hardlockup_touch_cpu(unsigned int cpu)
 	per_cpu(watchdog_hardlockup_touched, cpu) = true;
 }
 
-static bool is_hardlockup(unsigned int cpu)
+static void watchdog_hardlockup_update(unsigned int cpu)
 {
 	int hrint = atomic_read(&per_cpu(hrtimer_interrupts, cpu));
 
-	if (per_cpu(hrtimer_interrupts_saved, cpu) == hrint)
-		return true;
-
 	/*
 	 * NOTE: we don't need any fancy atomic_t or READ_ONCE/WRITE_ONCE
 	 * for hrtimer_interrupts_saved. hrtimer_interrupts_saved is
 	 * written/read by a single CPU.
 	 */
 	per_cpu(hrtimer_interrupts_saved, cpu) = hrint;
+}
+
+static bool is_hardlockup(unsigned int cpu)
+{
+	int hrint = atomic_read(&per_cpu(hrtimer_interrupts, cpu));
+
+	if (per_cpu(hrtimer_interrupts_saved, cpu) != hrint) {
+		watchdog_hardlockup_update(cpu);
+		return false;
+	}
 
-	return false;
+	return true;
 }
 
 static void watchdog_hardlockup_kick(void)
@@ -191,6 +198,7 @@ void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
 	unsigned long flags;
 
 	if (per_cpu(watchdog_hardlockup_touched, cpu)) {
+		watchdog_hardlockup_update(cpu);
 		per_cpu(watchdog_hardlockup_touched, cpu) = false;
 		return;
 	}

-- 
2.53.0.851.ga537e3e6e9-goog



