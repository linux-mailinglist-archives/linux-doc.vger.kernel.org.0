Return-Path: <linux-doc+bounces-90090-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAn3CmkDGmrK0ggAu9opvQ
	(envelope-from <linux-doc+bounces-90090-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 29 May 2026 23:21:45 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B13A4608D6C
	for <lists+linux-doc@lfdr.de>; Fri, 29 May 2026 23:21:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F420305BB62
	for <lists+linux-doc@lfdr.de>; Fri, 29 May 2026 21:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A10103BB105;
	Fri, 29 May 2026 21:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="boqY+kMg"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB34376A08;
	Fri, 29 May 2026 21:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780089630; cv=none; b=pzh4Gw4NeZMCQ2EVXgVEG+z8X3Qz1AR2sBAYxEoBDITrxwIqihqINMUGoqm2K0J9HcjN+CT+/0jlhbKPOwVPxDenirKzZuWBheGJYX1NmpRNNuDC+MiAs3AdSQ3lVK84yOq9nHLVhU0DLDeb7Bum7Tss+Kkpb4G8/GueF8BNzJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780089630; c=relaxed/simple;
	bh=CqSv9cmPJO/PxD6q49Z67NKiZbXS5jDlvbMSTGZIxCU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bf5Vpox7KDjo55WXAF5ooKaR1US9jLew00IWksueRYm/ViEMetVwQrQDi6I0mUJuKN5EDMJLV5mFLwLedGjLvOAKITXDcyWtw3Xx5QGtvbZ54WX4RJ5HhSjLMEMvtVdShPjo+FtljawcILUriVIDJlTUk6sULqRZLclEf/uIsLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=boqY+kMg; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=saVoIXt3/fcxXLiwGsf1nAuW7aBnL6Qy+Cl1HCXemIs=; b=boqY+kMgkTOmSL+TlAq39Zm7I3
	8v1VFy5wyhP7HbLuNQefIq3uL7Cs5dy7WtkqadWQytOXwwINtuetYO1599bMbZUKtnBtuiguRrpP6
	0gA582ZscO4lQvCv+/clVAPtfX09OiojlGlTjmuWWqQOOiYJlEyq8PYfQ8TSLqcijhnIHXvaKTiXM
	4p42+C6GL4R2jQy4yPBC7xgWuep3L9atLo480MDQbQ7FH2pSGycPY7Q9VtkkiRWK3Oq3Ty31VfWHc
	YKCPZpZfILTqHJUx0aSpnsaUAq8JfNutVetC1c4Rg+zVbeb2OrQIDhmc2EPcka8HGllph60zmHhNo
	sAUBrQyw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT4d1-00000008F6L-0YMi;
	Fri, 29 May 2026 21:20:27 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 2/5] watchdog: linux/watchdog.h: repair kernel-doc comments
Date: Fri, 29 May 2026 14:20:21 -0700
Message-ID: <20260529212024.2119204-3-rdunlap@infradead.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529212024.2119204-1-rdunlap@infradead.org>
References: <20260529212024.2119204-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90090-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[infradead.org:+];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[roeck-us.net:email,infradead.org:email,infradead.org:mid,infradead.org:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B13A4608D6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert struct comments to correct kernel-doc format and
add one missing struct member description.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: no changes

Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org

 include/linux/watchdog.h |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

--- linux-next-20260525.orig/include/linux/watchdog.h
+++ linux-next-20260525/include/linux/watchdog.h
@@ -26,7 +26,8 @@ struct watchdog_device;
 struct watchdog_core_data;
 struct watchdog_governor;
 
-/** struct watchdog_ops - The watchdog-devices operations
+/**
+ * struct watchdog_ops - The watchdog-devices operations
  *
  * @owner:	The module owner.
  * @start:	The routine for starting the watchdog device.
@@ -59,7 +60,8 @@ struct watchdog_ops {
 	long (*ioctl)(struct watchdog_device *, unsigned int, unsigned long);
 };
 
-/** struct watchdog_device - The structure that defines a watchdog device
+/**
+ * struct watchdog_device - The structure that defines a watchdog device
  *
  * @id:		The watchdog's ID. (Allocated by watchdog_register_device)
  * @parent:	The parent bus device
@@ -83,6 +85,8 @@ struct watchdog_ops {
  *		Replaces max_timeout if specified.
  * @reboot_nb:	The notifier block to stop watchdog on reboot.
  * @restart_nb:	The notifier block to register a restart function.
+ * @pm_nb:	The notifier block to stop watchdog on suspend and restart it
+ *		on resume.
  * @driver_data:Pointer to the drivers private data.
  * @wd_data:	Pointer to watchdog core internal data.
  * @status:	Field that contains the devices internal status bits.

