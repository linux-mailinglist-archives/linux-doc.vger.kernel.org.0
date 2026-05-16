Return-Path: <linux-doc+bounces-87894-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPuBGbHCCGph4AMAu9opvQ
	(envelope-from <linux-doc+bounces-87894-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 21:17:05 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C7555D826
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 21:17:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A096530048E5
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 19:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 497801DE8BE;
	Sat, 16 May 2026 19:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qrUU6Al7"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE9D305675
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 19:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778958971; cv=none; b=Rr1nCXWq6K04N0uKLWj8Ei2oMGORv0yTzoprmXo+AftGXlBiHAxLxx2DnqNOElIiy8wOp+ibwgo5sTicbdL1X/cPbQOXuLhaERnPPE22SHidTBY2RYe9tJfoHMNrrOZXRjVZl0vM007vuGGyRd23W1WOk2/4u9rq9seEdBdXlCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778958971; c=relaxed/simple;
	bh=qGIBGexyfFj6LjXFBwoBsxpdBp3bT7s/lUbl600vSx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KHvOd8YkO7qB55FuMQF3CSnipZzyRB1UdyuGzQqHkVImQitoPsAa7UgKjF+DGuxOwB4nEmTceMUAbwNRTia/SBW+d5PQ3G3Lv4GR+3CpDs6kDBUHz99b89W05MngmTO/J9F74FtXDArBtfg38KUYlXvBuWqQDvCDVWYxyKa3GCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qrUU6Al7; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8353ca0f1f1so382222b3a.1
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 12:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778958969; x=1779563769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1BcRVxWXJ6avUo9fIfWR1yAa2joVsWG/5Yew2PRe4zA=;
        b=qrUU6Al7i+BX6suPcjEgvgu19HgDLyY/UUn1y0oztw4S00bQ20RUFi3ouOHSsfKxVs
         sAE1QJ8twYhC2bQXLo2Uww+fcYET5lQ7sxU9NYpCfy2m9JQTGx8+fpc/bnTyrOZ702fy
         jSoSSpaxqdNTLLiQCoVKgX4yInSriTytU7oK3HoniTA0su797k4/fU5zfvU2DTDLPafT
         +y2STieydbbe1FGrxEI31OWXAu3nTHnfdbrIkFXOoc+j6x0uhBySYvSXNlhr1Eu/xz19
         LEb/Q0grCt79SDExPdxVnH8lxlzu7kDPrFF9XtBrQizaLBstWkjNgoMVWR7Zy5NsaNTb
         zspQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778958969; x=1779563769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1BcRVxWXJ6avUo9fIfWR1yAa2joVsWG/5Yew2PRe4zA=;
        b=tWHDqJIFRgI8losT9hUhqlyhWYHlrNDGF7fLdkWNWqKQ3QUNXFbAgFznDhq4CLqMHQ
         OXEq0/O0e8aFbVDFu6pMcnvfcXMvMcWASVKiBIbBWB+Q+jkuu0kG6V9nC1EdFWe6E0pd
         6Ei/gXA5lADnu5kB9qBTL2tdelhi2MmZfEQ8HAhfIEWqXxJQnysDIsgiSmQ8jjjCoq7v
         4zgSf0OL9p3bmzk5usWwlIrPtx/YYM3Wqo/FkphpPCIQAbexoI0sVzERGsckNIGvUO92
         VXu5J1iKHdz55eSM3cm9bPw0UVEPFQ7IQOfktrHnvp82kmnxQ7HMluFzedCBaELmOD8r
         goyA==
X-Forwarded-Encrypted: i=1; AFNElJ/m+zGt5rygKUmvqzfVfKZB6cJztVHgNjCkLa9GylLor0/dOtJqsr9C3Dp6taY+1oeURWYKt1peJO8=@vger.kernel.org
X-Gm-Message-State: AOJu0YySS8/JbWoirZjnkq09O9J0ucC7cvzXCiob8+sL0bdvrdSU+Bej
	QSPfntnkFueiy5t0Lz98otNvndvc2rSELgSPx7NNfHbsNazOB0MT7x7A
X-Gm-Gg: Acq92OEt2zPeksci4BJ+X/4vAnKJl/3DWhXS/kGnHjqAMVJGE6o/IrjAwck68WtOPGY
	8emaJMsBLMlSMJjxtU4IofoNcKOASkjgdRDL4070dvA0bDmMyG3ItJG8rJ5Q/1AtP8OXQofcsrn
	ZC714iESYbG90ZELlHwEg/XzKuo+HZIV/vo24sroxWk7WkjSfKpwb3G0fA/9UKI7UrJGnGZXSeb
	DvDMSbyMgFxDS0Tr9PPVRIBLzBYJ08tToemamaH3sZ/W9YYS7lCoFgPWR1jeh7A36UDMEd6i1q+
	xkoOdq17pTPFsEBi9oY3FLblYum2DoR9cOCQIkUb9H3vIbkGFz6Yk0C+VpUDtACI2uFzLOTrNAD
	+UwQzd6+fGYFmE6V4uNNrCTLG0PpKhfN3Hjbl59rvrGVLvdzESnLgS6EkG9lehTHBkf/cEOndUi
	uY+vKEUWY+1kcZx272171PmQLA63FOPnTalZ1fx4HFd8nrr9B0k9mCwr0JpJBl1T7Auqo9
X-Received: by 2002:a05:6a00:2394:b0:82c:7420:82bf with SMTP id d2e1a72fcca58-83f33c8a27amr7135767b3a.19.1778958969274;
        Sat, 16 May 2026 12:16:09 -0700 (PDT)
Received: from fedora.taildae27b.ts.net ([2409:40e5:100a:b5ee:87c:e578:2b2e:422b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19661261sm12297625b3a.3.2026.05.16.12.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 12:16:08 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH v2 0/2] raspberrypi: firmware and hwmon voltage support
Date: Sun, 17 May 2026 00:45:53 +0530
Message-ID: <20260516191555.17978-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C2C7555D826
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linuxfoundation.org,broadcom.com,vger.kernel.org,lists.infradead.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-87894-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chakrabortyshubham66@gmail.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-doc];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Changes in v2:
- Patch 1/2: no changes
- Patch 2/2:
  - hide unsupported voltage sensors using .is_visible()
  - replace the label switch with a string array
  - update raspberrypi-hwmon documentation


Shubham Chakraborty (2):
  soc: bcm2835: raspberrypi-firmware: Add voltage domain IDs
  hwmon: raspberrypi: Add voltage input support

 Documentation/hwmon/raspberrypi-hwmon.rst  |  15 ++-
 drivers/hwmon/raspberrypi-hwmon.c          | 134 ++++++++++++++++++++-
 include/soc/bcm2835/raspberrypi-firmware.h |   8 ++
 3 files changed, 152 insertions(+), 5 deletions(-)

-- 
2.54.0

