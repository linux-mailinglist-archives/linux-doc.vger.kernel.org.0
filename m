Return-Path: <linux-doc+bounces-96450-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FtFuK5tqU2rdagMAu9opvQ
	(envelope-from <linux-doc+bounces-96450-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 12:21:15 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB2F7445A6
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 12:21:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.s=20251104 header.b=vS+IOZ7q;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96450-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96450-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F879300F7A3
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 10:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C0C13A450A;
	Sun, 12 Jul 2026 10:21:01 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D873A4F46
	for <linux-doc@vger.kernel.org>; Sun, 12 Jul 2026 10:20:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783851661; cv=none; b=Z3OE9aisd5bjjT8xsH/JAZN8lqym/2/n1uJ87ewYTsYgnF2aSYeuAd/aiT1clECGiaQdfRNjfjcdJYXhu83ak9Df4TNX9k6XXmN7ZVqWmW5QaTpec6u4atxY2sZjq2A1QZRwroFZT6wrWtBW8N4SnmD6ZC7m80b07gCIqZ7nop4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783851661; c=relaxed/simple;
	bh=LbQuTQZ0Pr0m3R7vmjHIVUKClw/nFOcuwqEj3p3Hj4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=REM4Rl2UdR+ZwLJDiKJrwgKSLsTFmyV2lKkSafDp1xDY5NmpRFYZrTMFIRaNQEOki0KfrUjLrgL/xE7rEjXo8yMxAnKvPoG4fQ+or1ZR2aQIuDnsgM2yS10nErv3dSfcwiR/S9fYfbOSb+QWTT9xrGMsKV+XQLStR66pcDXl3JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=vS+IOZ7q; arc=none smtp.client-ip=209.85.221.51
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47f365afc5aso196871f8f.0
        for <linux-doc@vger.kernel.org>; Sun, 12 Jul 2026 03:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1783851655; x=1784456455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/g3zYl79jgjqjNI27fNzLhdq4bY9YgKy83ASVS+p8JI=;
        b=vS+IOZ7qeMV2j+NvtLmGX8T95arlpXlIAdkRHT8JhOcoKrXkXKOL8yARFE9nJQvMzG
         Ugh206qJDdJUO+6ERPGqcM6NLb0Bo7nZ2bJncs4Cz+k7voOeyj5GkTcy09fyQtTs2WWz
         H96GrtZ+eEH4F0regL6BpaBAP9tovYo9kSeNYxBt0KOtl+W4RuP/rrGGKEaQtWPl6okn
         Xz0UL/blSaREZ/S2V/D5H11uF2TwKKKbIGy2ItUOOpLbQ0yCXcIf4msxPOVX2v2v0E2p
         6jxtfI/2P2ax8+sabPCMmPnw/b+6zxleZd+SoJjCWnA3Ayc9/CLjK6W54PhvMuhg5iwF
         dOVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783851655; x=1784456455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/g3zYl79jgjqjNI27fNzLhdq4bY9YgKy83ASVS+p8JI=;
        b=Ajv7Uthmqq6+LcvkmV6EE8xZ3qfviOJccrXWqJD/yYYALJgcSXWZ1q/X7AZIKf7FPg
         tghCvzvAT0NyzLU7VhqzvmzPiPXhfjjm6upKL3eoZe0OlZBeA3F9fK9DwBuhAiv/0j2J
         HAS+OrSLcplCyPK+5vSxmuBGTqNu1rnRlmAaACe/MTURlf72cslEUG2vfMvourgPh9fD
         sVae8qKvAUniB6K2p+lX1+ctIcbW0oLB0JEXOwz3Rg3V0GIJxdLdlN3gPbHXeAQhGy8z
         cwvf2vXvbthICMsvlm/hw4j+gR5z0l9Monpk5mA3M02byTzMShaTYqqs8mRsKrc0XF9U
         Majw==
X-Forwarded-Encrypted: i=1; AHgh+Ro4sUxcjspi8SqOU0LcXJHBUyEx4gJXsNHnPQsO/1C+bAzEYt4WKf9apTw0k/WeCVyxhv2alNhD3j8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzH23MOggJAMrWw3BiKOeu0zXQnpA/trmC52JeDIWvgSvxYbUXH
	xsNoU8RCQ7aTwuGAXhyP2nVFOd38hbV2OymcCumxseC4ImkvCW8ZLrLcBwWgQ4fegOo=
X-Gm-Gg: AfdE7cl68X66XFHrvp3i2GsJ3oG1BGGTeuo5EY3auD7L5l4WSkuSa/zV/GnzNvfGIEF
	CLirXFTK2b/8ppjhnRJfmz2gG8O+DSl9a5ImLEpw/l3klkBlb4Ga+ecgxA0oXwnogNKw2HGQPoZ
	VBl+2GvK/50H31t39lSA3/RsXqXVCe+WabIvyP37kcb2/GL53Ou62MYGcWMO0jczcLmL9zD7pEp
	nBsr6S/YY/8F8F+WHmvJ2DTL4yF7jQWP4Uk035CK11TJlvNPA9YyR7d4cOL0mnXxKSHwQR1sh2B
	daX4FGY0WTvS3zIfOdaFT0PBbKccUWN3s8ogrqR7hnUaHdn3fFZfgBwOByZwYf1F/iDpD4CkHPx
	WDjGFYwUbDciytbLF9M4c1ox8xY+rI43kSAuNPAY4p8nszq2ttUCkyLRrZm+k2fpBi/MPuG6oxK
	nkmXfgAH1SC2quzDvU5BJX/oj0I8Jr3zNcHSPI2vZGWhFs3S+uSwu8pT7UlWLzMuSU9XaPDTHHV
	oKPVbI6ZC3/vxzwXN0PwzgXREJL
X-Received: by 2002:adf:f3c7:0:b0:47f:2de3:b34d with SMTP id ffacd0b85a97d-47f2de3b435mr3662291f8f.46.1783851654747;
        Sun, 12 Jul 2026 03:20:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c5:7815:1301:f27:e3a8:2334:314d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ad21sm75005672f8f.20.2026.07.12.03.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 03:20:53 -0700 (PDT)
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Sun, 12 Jul 2026 11:20:35 +0100
Subject: [PATCH v3 4/6] printk: deprecate boot_delay in favour of
 printk_delay
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-printkcleanup-v3-4-574547b8f71b@thegoodpenguin.co.uk>
References: <20260712-printkcleanup-v3-0-574547b8f71b@thegoodpenguin.co.uk>
In-Reply-To: <20260712-printkcleanup-v3-0-574547b8f71b@thegoodpenguin.co.uk>
To: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
 linux-rt-devel@lists.linux.dev, 
 Andrew Murray <amurray@thegoodpenguin.co.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783851647; l=4810;
 i=amurray@thegoodpenguin.co.uk; s=20250914; h=from:subject:message-id;
 bh=LbQuTQZ0Pr0m3R7vmjHIVUKClw/nFOcuwqEj3p3Hj4Y=;
 b=R41m4NO6PR52KYXcKNaMGQef3mF4qMXlCyOa+etGfe9PI3pHfH2n12uQ921q9TEyV5MQ7i1Ck
 /UOSQgcFAYlAbGVI6lYGPv+gPu/l+5sphbueqDTDmrG+ar9Raust9yH
X-Developer-Key: i=amurray@thegoodpenguin.co.uk; a=ed25519;
 pk=0SU0Q8S/uEiCdbXbXS+PvJGUCaBG1nDszD+HPU3Js0Q=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[thegoodpenguin-co-uk.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96450-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[thegoodpenguin.co.uk];
	FORGED_RECIPIENTS(0.00)[m:pmladek@suse.com,m:rostedt@goodmis.org,m:john.ogness@linutronix.de,m:senozhatsky@chromium.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux@armlinux.org.uk,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:akpm@linux-foundation.org,m:gregkh@linuxfoundation.org,m:bigeasy@linutronix.de,m:clrkwllms@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-rt-devel@lists.linux.dev,m:amurray@thegoodpenguin.co.uk,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[amurray@thegoodpenguin.co.uk,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[thegoodpenguin-co-uk.20251104.gappssmtp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amurray@thegoodpenguin.co.uk,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,thegoodpenguin-co-uk.20251104.gappssmtp.com:dkim,thegoodpenguin.co.uk:from_mime,thegoodpenguin.co.uk:email,thegoodpenguin.co.uk:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1BB2F7445A6

The boot_delay (BOOT_PRINTK_DELAY) kernel parameter and printk_delay sysctl
are two distinct mechanisms for providing similar functionality which add a
delay prior to each printed printk message.

boot_delay provides a kernel parameter for delaying printk output from
kernel start through to boot (SYSTEM_RUNNING), whereas printk_delay is
configurable only via sysctl and thus is only used post boot.

Let's deprecate the boot_delay feature in favour of printk_delay. In order
to preserve functionality, we'll also extend printk_delay such that it can
additionally configured via an early kernel parameter.

Behavior change:

The delay enabled by both "boot_delay" and "printk_delay" continues
working even in SYSTEM_RUNNING state. It must be explicitly stopped
by setting printk_delay=0 via sysctl.

The delay is skipped when the message is suppressed in all system
states. It used to skipped only for the boot_delay.

Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
---
 kernel/printk/printk.c | 81 +++++++++++++++++++++++++++++++-------------------
 1 file changed, 51 insertions(+), 30 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 28e6dff2faa7d4294c1b2ebe2844ce5d4dc0e05a..4517266e9ca112e0dcb0163a99dd0e8d50931848 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -1291,43 +1291,28 @@ static bool suppress_message_printing(int level)
 
 #ifdef CONFIG_GENERIC_CALIBRATE_DELAY
 
-static unsigned int boot_delay; /* msecs delay after each printk during bootup */
 static unsigned long long loops_per_msec;	/* based on boot_delay */
 
-static int __init boot_delay_setup(char *str)
+static void __init printk_delay_calculate(void)
 {
 	unsigned long lpj;
-	int boot_delay_val;
 
 	lpj = preset_lpj ? preset_lpj : 1000000;	/* some guess */
 	loops_per_msec = (unsigned long long)lpj / 1000 * HZ;
 
-	get_option(&str, &boot_delay_val);
-	if (boot_delay_val < 0 || boot_delay_val > 10 * 1000)
-		return 0;
-
-	boot_delay = (unsigned int)boot_delay_val;
-
-	pr_debug("boot_delay: %u, preset_lpj: %ld, lpj: %lu, "
+	pr_debug("printk_delay: %u, preset_lpj: %ld, lpj: %lu, "
 		"HZ: %d, loops_per_msec: %llu\n",
-		boot_delay, preset_lpj, lpj, HZ, loops_per_msec);
-	return 0;
+		printk_delay_msec, preset_lpj, lpj, HZ, loops_per_msec);
 }
-early_param("boot_delay", boot_delay_setup);
 
-static void boot_delay_msec(int level)
+static void early_boot_delay_msec(void)
 {
 	unsigned long long k;
 	unsigned long timeout;
-	bool suppress = !is_printk_force_console() &&
-			suppress_message_printing(level);
-
-	if ((boot_delay == 0 || system_state >= SYSTEM_RUNNING) || suppress)
-		return;
 
-	k = (unsigned long long)loops_per_msec * boot_delay;
+	k = (unsigned long long)loops_per_msec * printk_delay_msec;
 
-	timeout = jiffies + msecs_to_jiffies(boot_delay);
+	timeout = jiffies + msecs_to_jiffies(printk_delay_msec);
 	while (k) {
 		k--;
 		cpu_relax();
@@ -1342,11 +1327,37 @@ static void boot_delay_msec(int level)
 	}
 }
 #else
-static inline void boot_delay_msec(int level)
+static inline void __init printk_delay_calculate(void)
+{
+}
+
+static inline void early_boot_delay_msec(void)
 {
 }
 #endif
 
+static int __init printk_delay_setup(char *str)
+{
+	int printk_delay_val = 0;
+
+	get_option(&str, &printk_delay_val);
+	if (printk_delay_val < 0 || printk_delay_val > 10 * 1000)
+		return 0;
+
+	printk_delay_msec = (unsigned int)printk_delay_val;
+	printk_delay_calculate();
+
+	return 0;
+}
+early_param("printk_delay", printk_delay_setup);
+
+static int __init boot_delay_setup(char *str)
+{
+	pr_warn("boot_delay will soon be deprecated, please use printk_delay instead\n");
+	return printk_delay_setup(str);
+}
+early_param("boot_delay", boot_delay_setup);
+
 static bool printk_time = IS_ENABLED(CONFIG_PRINTK_TIME);
 module_param_named(time, printk_time, bool, S_IRUGO | S_IWUSR);
 
@@ -2122,18 +2133,28 @@ static u8 *__printk_recursion_counter(void)
 
 unsigned int printk_delay_msec __read_mostly;
 
+static inline void late_boot_delay_msec(void)
+{
+	unsigned int m = printk_delay_msec;
+
+	while (m--) {
+		mdelay(1);
+		touch_nmi_watchdog();
+	}
+}
+
 static inline void printk_delay(int level)
 {
-	boot_delay_msec(level);
+	bool suppress = !is_printk_force_console() &&
+			suppress_message_printing(level);
 
-	if (unlikely(printk_delay_msec)) {
-		unsigned int m = printk_delay_msec;
+	if (likely(!printk_delay_msec) || suppress)
+		return;
 
-		while (m--) {
-			mdelay(1);
-			touch_nmi_watchdog();
-		}
-	}
+	if (system_state < SYSTEM_RUNNING)
+		early_boot_delay_msec();
+	else
+		late_boot_delay_msec();
 }
 
 #define CALLER_ID_MASK 0x80000000

-- 
2.34.1


