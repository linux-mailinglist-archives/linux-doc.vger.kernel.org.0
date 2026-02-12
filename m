Return-Path: <linux-doc+bounces-75943-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDDVEDRCjml3BQEAu9opvQ
	(envelope-from <linux-doc+bounces-75943-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 12 Feb 2026 22:12:20 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0ED13126A
	for <lists+linux-doc@lfdr.de>; Thu, 12 Feb 2026 22:12:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0E8F8300B459
	for <lists+linux-doc@lfdr.de>; Thu, 12 Feb 2026 21:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAA983033DB;
	Thu, 12 Feb 2026 21:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ocqfJnoa"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A710C1D130E;
	Thu, 12 Feb 2026 21:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770930733; cv=none; b=C65HSrNwkNTF2aN1AA5zfS2EwOsc7yYuYF2ch5YvJCWnTTYFlZCSOacA/wGHLACnN3fp8j/wgqcbUkm6nWK0lbFu87t06sWX+omWYto0UJoT4yNnpviOLY9bIEn3H0BM+HNy09FnVKGucyirlP2bELELuhwr++3h4rh7dAQF+Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770930733; c=relaxed/simple;
	bh=+s+4P6HGCAeRYpPcFFirWuyM7SRq/7NhLTjERkoTthM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tnKk94fvSiy1kFSp/GuS0zrYg4yFlygCRROVjk3C8AkVh8N7R1s3MAlHD/lU0fHa1aS87IO6oMsTLTnT8azUF4UXiFKiQcC2HTqEiQsCRuomeiarvxSPWDzm3A4LMI0OSsXvULAyGELnSifBU5JbfLZRl4pPB/ENqlwAHUt0KoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ocqfJnoa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6538DC16AAE;
	Thu, 12 Feb 2026 21:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770930733;
	bh=+s+4P6HGCAeRYpPcFFirWuyM7SRq/7NhLTjERkoTthM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ocqfJnoa2CNR5K9okIe4dKxZOfbQ+N+Lv/phLhZqEIEuaN4Dz3GY0yCkQzeNliQD8
	 3Kkz1M2DKRmB39Bj7iKAmJjz9dVhn62dSccYMv03O9RXCQyYoaznO5AAu4wiNujsn+
	 hiem/an1AB7f1egMD8w+2wuP5rmlj03VspRXN+IG8fT5SvfLd6lMIxkx8ORdbfxwfd
	 Fxc1orJOgWw/5V/TaIBBmPbLKdYMK21Jta2M/8spXBsoB2U+qIrzIskypznKPQyiCJ
	 t+8Wzh8+xJbQ2DyGNJh9Nc2UX+Vwd4gfuykorl+r1gS7nMbWKTqb2MaYitUAGdGg2v
	 6r+9QsnautiQg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 586A4EEA850;
	Thu, 12 Feb 2026 21:12:13 +0000 (UTC)
From: Mayank Rungta via B4 Relay <devnull+mrungta.google.com@kernel.org>
Date: Thu, 12 Feb 2026 14:12:10 -0700
Subject: [PATCH 1/4] watchdog/hardlockup: Always update saved interrupts
 during check
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-hardlockup-watchdog-fixes-v1-1-745f1dce04c3@google.com>
References: <20260212-hardlockup-watchdog-fixes-v1-0-745f1dce04c3@google.com>
In-Reply-To: <20260212-hardlockup-watchdog-fixes-v1-0-745f1dce04c3@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Petr Mladek <pmladek@suse.com>, 
 Jinchao Wang <wangjinchao600@gmail.com>, 
 Yunhui Cui <cuiyunhui@bytedance.com>, Stephane Eranian <eranian@google.com>, 
 Ian Rogers <irogers@google.com>, Li Huafei <lihuafei1@huawei.com>, 
 Feng Tang <feng.tang@linux.alibaba.com>, 
 Max Kellermann <max.kellermann@ionos.com>, Jonathan Corbet <corbet@lwn.net>, 
 Douglas Anderson <dianders@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Mayank Rungta <mrungta@google.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770930732; l=2116;
 i=mrungta@google.com; s=20260212; h=from:subject:message-id;
 bh=jeXyM9Zz7zH/TkvXATjr1ijroPIgJAbT1ZySlVxvX+0=;
 b=EmrlxcFLuYgP97uSm+OPQWshCcXqiYiX/U9ySJP+u6v+S8ri2MGxrjnlbzHiWziBLLVQq67/z
 PyUOFRmfLP/Bu/cARWpsnG6+ROx7Q8wk3Ov4Zum4cfI4UiAHhwZ5Hts
X-Developer-Key: i=mrungta@google.com; a=ed25519;
 pk=2Bjwbv/ibL10QnyvK9G7DoKpffXy7z6+M4NawEYgYDI=
X-Endpoint-Received: by B4 Relay for mrungta@google.com/20260212 with
 auth_id=634
X-Original-From: Mayank Rungta <mrungta@google.com>
Reply-To: mrungta@google.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[lwn.net,suse.com,gmail.com,bytedance.com,google.com,huawei.com,linux.alibaba.com,ionos.com,chromium.org,linux-foundation.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-75943-lists,linux-doc=lfdr.de,mrungta.google.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-doc@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	HAS_REPLYTO(0.00)[mrungta@google.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6D0ED13126A
X-Rspamd-Action: no action

From: Mayank Rungta <mrungta@google.com>

Currently, arch_touch_nmi_watchdog() causes an early return that
skips updating hrtimer_interrupts_saved. This leads to stale
comparisons and delayed lockup detection.

Update the saved interrupt count before checking the touched flag
to ensure detection timeliness.

Signed-off-by: Mayank Rungta <mrungta@google.com>
---
 kernel/watchdog.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 7d675781bc917d709aa3fb499629eeac86934f55..b71aa814edcf9ad8f73644eb5bcd1eeb3264e4ed 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -186,7 +186,21 @@ static void watchdog_hardlockup_kick(void)
 
 void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
 {
+	bool is_hl;
 	int hardlockup_all_cpu_backtrace;
+	/*
+	 * Check for a hardlockup by making sure the CPU's timer
+	 * interrupt is incrementing. The timer interrupt should have
+	 * fired multiple times before we overflow'd. If it hasn't
+	 * then this is a good indication the cpu is stuck
+	 *
+	 * Purposely check this _before_ checking watchdog_hardlockup_touched
+	 * so we make sure we still update the saved value of the interrupts.
+	 * Without that we'll take an extra round through this function before
+	 * we can detect a lockup.
+	 */
+
+	is_hl = is_hardlockup(cpu);
 
 	if (per_cpu(watchdog_hardlockup_touched, cpu)) {
 		per_cpu(watchdog_hardlockup_touched, cpu) = false;
@@ -195,13 +209,8 @@ void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
 
 	hardlockup_all_cpu_backtrace = (hardlockup_si_mask & SYS_INFO_ALL_BT) ?
 					1 : sysctl_hardlockup_all_cpu_backtrace;
-	/*
-	 * Check for a hardlockup by making sure the CPU's timer
-	 * interrupt is incrementing. The timer interrupt should have
-	 * fired multiple times before we overflow'd. If it hasn't
-	 * then this is a good indication the cpu is stuck
-	 */
-	if (is_hardlockup(cpu)) {
+
+	if (is_hl) {
 		unsigned int this_cpu = smp_processor_id();
 		unsigned long flags;
 

-- 
2.53.0.273.g2a3d683680-goog



