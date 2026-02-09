Return-Path: <linux-doc+bounces-75638-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YH0fK6OAiWlx+AQAu9opvQ
	(envelope-from <linux-doc+bounces-75638-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 09 Feb 2026 07:37:23 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DACF10C29A
	for <lists+linux-doc@lfdr.de>; Mon, 09 Feb 2026 07:37:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 467B23038AE3
	for <lists+linux-doc@lfdr.de>; Mon,  9 Feb 2026 06:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF2022EC0A7;
	Mon,  9 Feb 2026 06:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kIrtZYCt"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817592DC76F
	for <linux-doc@vger.kernel.org>; Mon,  9 Feb 2026 06:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770618894; cv=none; b=lbdj+Rem90C1vHkm8Aw1MhVqqXPsgBFi+nW118dlONAaDB1BEDJCFdtbxwmyK+jyfsjqF/MC1GSpRFD5tIX1M24LbsqWseZVOBh/P8JxLjyI0bzcoAGZVkq33Pi3LMOlf68NsitrP6nN3I2V+42VYNHyHETKUs+p0MxEUEmM0j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770618894; c=relaxed/simple;
	bh=xPVSlWvaet9868GsCY1jJthXsfYn5a7/fBimRT/J9Pg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PDDpqM60/xbDDVXzLBI54z1oD+LIaqEu4FZCyHVNvBvgmLyuu8uW18F9OfMtP2CTd6nbskOjMfWhyKlftD9Kjl3OTRNGdyzOLfpmN4AbxIb3CIOkg6z6CRssjFm/2Jn9x2+6k+Xiq5wpZ3KWAB4c3qs1oEv+RXPTa72PVx2REo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kIrtZYCt; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-8230f8f27cfso1761434b3a.0
        for <linux-doc@vger.kernel.org>; Sun, 08 Feb 2026 22:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770618894; x=1771223694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxx+6jRrhPvMg9VlbKNlTg2M9XXacffYRgMnxqmD5m4=;
        b=kIrtZYCt+ntZFLk8+m/5/ZGUGU0smEuVFkc7WEKr7raz3CxztMaozeDtXPo6Xskg44
         NUjUwU5Pe6zC2MW4xtNwri58qJPj+io8AU5a0k25VYBeD4uYLakDBF5CCesl9y4ZEBet
         T7K0vRAobHdBS++Z8gfYjUnBXhu+lKsRxXMr5V2iVfRovFoHm6GcI+o/XCgMqo83Ac2H
         BjPcC98698KZX1dOuKMdzVJJYWsUfYw+kKjFAOJhNNl0UWbuFGM4TkU6HEnxcLI7C/0v
         cCkdsEBF5RUZbZ/pldzFu+9CFqc2sk1owb+fHv14YuYOdpMeVUxtbyg931RuvPH45WuX
         wWmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770618894; x=1771223694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mxx+6jRrhPvMg9VlbKNlTg2M9XXacffYRgMnxqmD5m4=;
        b=vWHwAI4ZWIXfqMcQCbXBQP3v5BUVEjYUsnC7r0jTOo/K6oBxvwZ67uH35Rvnd5Xxof
         4MITXdnQR1p/AxsH4SQCT27zkDUQBbuRPzetOlsug20eeuaETPx7ZRVDWz0HCNGbbACp
         p0ka+5okUJiOzICyQaSdbEqpar1g5vieTSXp+TUpyhh9CdS1Qi5lj8145TcDs1Ndw+l7
         ydCUMmn2oLUSMin28mhDImOHnGPqIWA62GjgufwXlnUZkAFnTJ7lzHTk23RdNLavqdPE
         0c+p5pI0w5xkXtNK94CuOOCzJucQoh21GyFNEeAEed6Sd0ze4q96O4wxk49ICT3tdJLu
         dIMw==
X-Forwarded-Encrypted: i=1; AJvYcCX9qv/ULrr1NCatbSusotx8xrGttjUZWmpFOg7oTAJ2vgJ1LPmZxsvM/EJ3v3DMGcFCneANDO8c3bA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQkn5vEQT4NQiGwRGwbA+yK62RuJ5gTY4Qwni81S166PPzx/23
	L/w7kYR75mwHbJ7FjSodVgnv7pk69+nNO0zfb1K831gdQbKaIUpqjWKC
X-Gm-Gg: AZuq6aLXP+NPOlkgqlTlX9DCE5jOqNTfRX4rT40E7e68PcZ04GWN4vhoVafSLTa6pg5
	gFi+p8qG9qqiXRjdEOidkxrgIk9pQsjg8va/qmRcOm1gwdAUZzwxILwh1RXHR+CCdEj9sPQgr0y
	FF/8FzrhHbAeUZO4NZUbw8ye5wlWBche45hdWsDNKcgk/U87CMybJl1BWV7bJdykaxFQUDq1F0H
	4Li/n3smXsuZBcuVXQWLfWwnflx+ARS44WEm215sakDdoeS7K8GUYH9K6qPDtYfEkKqmZfOJsRg
	nyoiBYz/xpDxIIpWYwLw6cnmubsavGxyhgCdqz0N6iJYR0Tup66xW39EjZSs8esm9acPLs/G97S
	t7w9lfxtJiIswYOsxvUwXmhJ/tk9mO46/HOvuqElHcQGoeVSAtbS9fDHi45dwMnhxYAt8nwp5U9
	EBGNBLRn9/QrMmWXtiNmfa7vq+qWYoGcSLB0WyTQ==
X-Received: by 2002:a05:6a20:d703:b0:361:4ca3:e17d with SMTP id adf61e73a8af0-393acf882e8mr9701322637.13.1770618893792;
        Sun, 08 Feb 2026 22:34:53 -0800 (PST)
Received: from c12-ThinkPad-X1-Carbon-Gen-12 ([2400:2410:5f2b:700:e705:6ccd:6241:6a0a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aa3ec42e2asm83440455ad.53.2026.02.08.22.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 22:34:53 -0800 (PST)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: mpearson-lenovo@squebb.ca,
	dmitry.torokhov@gmail.com,
	hmh@hmh.eng.br,
	hansg@kernel.org,
	corbet@lwn.net,
	derekjohn.clark@gmail.com,
	ilpo.jarvinen@linux.intel.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-doc@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH v7 3/3] Documentation: thinkpad-acpi - Document doubletap_enable attribute
Date: Mon,  9 Feb 2026 15:33:55 +0900
Message-ID: <20260209063355.491189-4-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260209063355.491189-1-vishnuocv@gmail.com>
References: <20260209063355.491189-1-vishnuocv@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sourceforge.net,lenovo.com,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-75638-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[squebb.ca,gmail.com,hmh.eng.br,kernel.org,lwn.net,linux.intel.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnuocv@gmail.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-doc];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4DACF10C29A
X-Rspamd-Action: no action

Document the doubletap_enable sysfs attribute for ThinkPad ACPI driver.

Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
---
Changes in v6:
- Fix formatting of doubletap_enable sysfs documentation (separate Values list)
---
 .../admin-guide/laptops/thinkpad-acpi.rst     | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
index 4ab0fef7d440..9a660724648b 100644
--- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
+++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
@@ -1521,6 +1521,27 @@ Currently 2 antenna types are supported as mentioned below:
 The property is read-only. If the platform doesn't have support the sysfs
 class is not created.
 
+doubletap_enable
+----------------
+
+sysfs: doubletap_enable
+
+Controls whether TrackPoint doubletap events are filtered out. Doubletap is a
+feature where quickly tapping the TrackPoint twice triggers a special function key event.
+
+The available commands are::
+
+                cat /sys/devices/platform/thinkpad_acpi/doubletap_enable
+                echo 1 | sudo tee /sys/devices/platform/thinkpad_acpi/doubletap_enable
+                echo 0 | sudo tee /sys/devices/platform/thinkpad_acpi/doubletap_enable
+
+Values:
+
+        * 1 - doubletap events are processed (default)
+	* 0 - doubletap events are filtered out (ignored)
+
+	This setting can also be toggled via the Fn+doubletap hotkey.
+
 Auxmac
 ------
 
-- 
2.51.0


