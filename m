Return-Path: <linux-doc+bounces-90199-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNjJBULCHGrPSAkAu9opvQ
	(envelope-from <linux-doc+bounces-90199-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 01 Jun 2026 01:20:34 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6270D61843C
	for <lists+linux-doc@lfdr.de>; Mon, 01 Jun 2026 01:20:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF14F3047BC7
	for <lists+linux-doc@lfdr.de>; Sun, 31 May 2026 23:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50468377541;
	Sun, 31 May 2026 23:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="SXy+4G8O"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA323769F4
	for <linux-doc@vger.kernel.org>; Sun, 31 May 2026 23:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780269484; cv=none; b=jTWEBJ2jFArRA1gKbLU+WM8eN4lL5+y2gKQ/Y7cfpXZbkjEBLgSuH29rYaLub3nx1NORJMH5M54L5WcgTbjm8XjNfjMxtiOPuGM4NP4mdKqCGcSMD1tyWCtHSbkwwJ4LMBbjZ4uWENwXda6uWtMx9gLvRXk73+8ZhOagarc/Qes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780269484; c=relaxed/simple;
	bh=J0TSqvvk90SLybR+T1e1sTTGdTS3luxuOAEJPWZwCwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O1QQ6MUKfiO7jn4VksNxF8Vpm0MPzEsbJnvioOScFPQomRlWE2IsTIeFXJQ8WkZ6XtRObu9vNOLvMu7VUMbRcVuvhSH9vsjpQWRGLgWssSguXc42gTX5yl0m4D9K0dzVRPsd+VkDh4KerwX+3x+fWbE9OVhCNshpWjghGQca8SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=SXy+4G8O; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45eea3448f2so1919923f8f.2
        for <linux-doc@vger.kernel.org>; Sun, 31 May 2026 16:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1780269480; x=1780874280; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=65QPkXlxoBn1znpFptZPvrSc/q4l7OLH3BDyCKXpuCk=;
        b=SXy+4G8Ona8neOUIkF6BNfYfnyh+DDXIBUAeD3w4bNSAfKyvtbaMtN96HDErzQfk4z
         ODyyUWisbfA6vaZKamp7Sy+Nh8TrjakTXUlfZeK88x9F8P4KEjP8efgpventSBIfbUEC
         lWu7wJ7Yv8l6d7W//IWNPA6ZN88d3Nci9TDv0SKGuQRW080koAgLIGo5FLt8iEgpgyXO
         VfX7GJAjCJzeb7NUdbzsr/oyN4IVydGQb10dwDPxtd16z6O372kXxijGAZkzfnicwzUp
         hWoBpOnYuqTQgFpc+5pJG8xSJND+KvYfCPVSYFIQTwGUZBqBcse4msEjmSAr2inqjEXh
         qRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780269480; x=1780874280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=65QPkXlxoBn1znpFptZPvrSc/q4l7OLH3BDyCKXpuCk=;
        b=PQfIHO/2P/7t+EcO+rU0B4IoPGk4yUsTzd1obYcJVZYuHdogMikO4tJkOBGv78qmTp
         nkVhxw3u+io2zIA8vEJCBs8jcsN+/gmDXZZtZHRMsfXbwXJ28RXgNyJOj2nDBOUXz0QN
         No3G/ec8a84u3LLuXlRRZog7LyOhRAtBTr+1b3CkTu5goU9XpxoZ8x0oWzfLZBTLi6yD
         CILqJ7JKAcvH7KUm1z0av60jKZgu2dK1xymU6gM6KVgmVRFa9+FKVxtH9xHzDmlzNTS3
         VRuwqmhR5u0lkE9NZK7cpXcY2GQUxTAvsSslb41RMupAAq47qir4KAOHBrrahvqFYEbW
         P3gw==
X-Gm-Message-State: AOJu0YzkgrFD3DTnHfwzd4g2cWd70OBR5q4v1TlXHUIJhlwUQDA9weJA
	WhtXdyxWs6W1xrSDHJXs591gNFX9oV5bcTHJISjGlnrtTx9nbfRW/em75u7nAqTSctE=
X-Gm-Gg: Acq92OGqmwgWIFpNsjHGr8ckaGKl4SpaEkxYtyPf5fxrAGY92T/AvViJ2+C6WW4AdKr
	ffgAArklJVtgg2OcTWFckCmHBrys/oe5a6KPSY6tmBecBwHebe/5g7xTn4z6mQ8TusxSWUiYrXb
	42DppYO2M3pUdUD4OR6qOvtJjV8OQQAqYwjCa785otWbYVpWElVE2b07+2VA+CFQYKFe2tgStjW
	RmXgwzPHgIkEiAKM9NLN8ZU1kYdkA7ufEE0necWW30+Oz+DuZtO/6Xwd8cAJvYYZkTfL2qFEjhd
	ZvEypT/jmpUc6E9CL0EdhoPc03Pcii+fAuCoNDoaKg5nEv1RNjTTISCkRY0tEw+31ZM2XRICZto
	6YQZrBmfVvB8NfjWMUuoiKF3tOHp5dWD8MknuAbwo+l9nSEO8eaZr0WCrGRmlZP4TACzy4l7FEu
	neLGuBsFeot2kHBYLLj9lqzNF7ouDboowP95ZwHiF4+DjmdVSIarlioWifO/2h/Pomp8dFDbbXr
	rBsvaadeXaIRbzXEoiYMtGFYezS/OhpGsWNe4x/MdLT0p8k/Q==
X-Received: by 2002:a05:6000:22c7:b0:44e:d7f8:3945 with SMTP id ffacd0b85a97d-45ef6b0d5f3mr16986293f8f.13.1780269480458;
        Sun, 31 May 2026 16:18:00 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c5:7815:1301:f27:e3a8:2334:314d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34b834esm20496544f8f.11.2026.05.31.16.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 16:17:59 -0700 (PDT)
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Mon, 01 Jun 2026 00:17:40 +0100
Subject: [PATCH RFC 4/4] Documentation/kernel-parameters: add/update
 printk_delay/boot_delay
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-deprecate_boot_delay-v1-4-c34c187142a6@thegoodpenguin.co.uk>
References: <20260601-deprecate_boot_delay-v1-0-c34c187142a6@thegoodpenguin.co.uk>
In-Reply-To: <20260601-deprecate_boot_delay-v1-0-c34c187142a6@thegoodpenguin.co.uk>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
 linux-rt-devel@lists.linux.dev, 
 Andrew Murray <amurray@thegoodpenguin.co.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780269471; l=2336;
 i=amurray@thegoodpenguin.co.uk; s=20250914; h=from:subject:message-id;
 bh=J0TSqvvk90SLybR+T1e1sTTGdTS3luxuOAEJPWZwCwc=;
 b=pLwcIzM8QLMrQYFp9ysGPIsBLbpYGr/QADoMsXS4xYve0tkQyYj8MwL5lG38y/JRyr/+m7k7Z
 dt3xNPGzPvaCCrZVvkxNqE0SfFMxQgzlLTNRPTyqg/O1adefKaVGgEH
X-Developer-Key: i=amurray@thegoodpenguin.co.uk; a=ed25519;
 pk=0SU0Q8S/uEiCdbXbXS+PvJGUCaBG1nDszD+HPU3Js0Q=
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[thegoodpenguin-co-uk.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-90199-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[thegoodpenguin.co.uk];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[thegoodpenguin-co-uk.20251104.gappssmtp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amurray@thegoodpenguin.co.uk,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[thegoodpenguin-co-uk.20251104.gappssmtp.com:dkim,thegoodpenguin.co.uk:mid,thegoodpenguin.co.uk:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 6270D61843C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

boot_delay has been deprecated in favour of an extended printk_delay,
let's update kernel-parameters to reflect the addition of printk_delay
and the deprecation of boot_delay.

Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
---
 Documentation/admin-guide/kernel-parameters.txt | 31 +++++++++++++++++++++----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 37b618d176f1c499f457f0d8b5679c29ee7ab177..0d6987a54a4f62a952664512fc8ddb18c6e70f5b 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -655,11 +655,19 @@ Kernel parameters
 			See Documentation/block/cmdline-partition.rst
 
 	boot_delay=	[KNL,EARLY]
-			Milliseconds to delay each printk during boot.
-			Only works if GENERIC_CALIBRATE_DELAY is enabled,
-			and you may also have to specify "lpj=".  Boot_delay
-			values larger than 10 seconds (10000) are assumed
-			erroneous and ignored.
+			Milliseconds to delay each printk during and post boot.
+			Boot time delays only work if GENERIC_CALIBRATE_DELAY
+			is enabled.
+
+			Once booted the delay can be removed or adjusted via
+			the printk_delay sysctl.
+
+			Please note that you may also have to specify "lpj=".
+			Boot_delay values larger than 10 seconds (10000) are
+			assumed erroneous and ignored.
+
+			This will soon be deprecated, please use printk_delay
+			instead.
 			Format: integer
 
 	bootconfig	[KNL,EARLY]
@@ -5483,6 +5491,19 @@ Kernel parameters
 	printk.time=	Show timing data prefixed to each printk message line
 			Format: <bool>  (1/Y/y=enable, 0/N/n=disable)
 
+	printk_delay=	[KNL,EARLY]
+			Milliseconds to delay each printk during and post boot.
+			Boot time delays only work if GENERIC_CALIBRATE_DELAY
+			is enabled.
+
+			Once booted the delay can be removed or adjusted via
+			the printk_delay sysctl.
+
+			Please note that you may also have to specify "lpj=".
+			Boot_delay values larger than 10 seconds (10000) are
+			assumed erroneous and ignored.
+			Format: integer
+
 	proc_mem.force_override= [KNL]
 			Format: {always | ptrace | never}
 			Traditionally /proc/pid/mem allows memory permissions to be

-- 
2.34.1


