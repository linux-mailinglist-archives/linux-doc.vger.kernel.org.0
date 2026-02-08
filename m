Return-Path: <linux-doc+bounces-75624-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCQKD2amiGmjtQQAu9opvQ
	(envelope-from <linux-doc+bounces-75624-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 08 Feb 2026 16:06:14 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A022D109088
	for <lists+linux-doc@lfdr.de>; Sun, 08 Feb 2026 16:06:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C36933037E4D
	for <lists+linux-doc@lfdr.de>; Sun,  8 Feb 2026 15:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9942735DCF9;
	Sun,  8 Feb 2026 15:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ch0kBBNH"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3324635E526
	for <linux-doc@vger.kernel.org>; Sun,  8 Feb 2026 15:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770563134; cv=none; b=T5BU0XiKXvc3nYyVN0x+mqoh8zeEriJbzpIL4nGuIFbISR6rg7t4JLOMy4oFyRWF/wVOUz7tl5C2ckg+pDDVpET1NZo68MwOrfvKzdc8wioBTQnKYf9KhSTJRuNoQWopaAyouDWegvEQFBZb+Z90CGMfT20/fhlyyXyXEyvFmZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770563134; c=relaxed/simple;
	bh=9/7QTpM9w9CetgDRp3W/v439sqmC/gELVsuHbq2pmD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZyE/holckd+nnVIrlCCXODz4AcTBZ7G2yKXPocz6ung5tzGpN/FvMN5d4oXt9eVLWXZhxGhik4VaDU364ccXPyJn5SPa1amOQRKJdpRPuV7slXNjdXbxFiN7oXvk40044IsCxq0enbwCD7COmDraEHy+uIhOpgodhvzGrrgaN0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ch0kBBNH; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4806fbc6bf3so25483405e9.2
        for <linux-doc@vger.kernel.org>; Sun, 08 Feb 2026 07:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770563133; x=1771167933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xbmaZh646ZKImMHo419Q/3GSUkucF5/edL1/4X8vppA=;
        b=Ch0kBBNH62QY6YYQ+nxagFaqOws5iBgV8VtSs7Yinh6wqmZPlGR/eZ5hTCGfhj8TWb
         K3VFuFKnMPs5vvKEkY3wvyavbJKR449xduffrSInJsPYdFqAXTynWY90yeofNDE7ELfc
         FGz6mCrfjf+GFSbLlgd/uoDPxEHvR/TnonqptpQDQKaoWBL4RC2dk7jbRNSNa8wjD5Hg
         HrMLNgcKnzXEHGyFbmvGuIAjGu7fPtJ/DKg2JuPb2cXpsTKUxLc7FiwE6MdMmA32AIyb
         e8Cby9oI2r8Mx+K2iD8AJuPoWmEaJ4ltpT48IBER5im/4R5HmMlxwfIyhADYtL4RW0eu
         IMFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770563133; x=1771167933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xbmaZh646ZKImMHo419Q/3GSUkucF5/edL1/4X8vppA=;
        b=j4upfLMEMvQ3eh9MMHJFmAqsF7npPLXmQt+LqpMJUI4pvkuj4EFo4ySeuQ0xh4CgLK
         OCpY3w5yNbA/LLeeyKrP11eEtl5zTqXYC76AwhrTclFEdYVU+UVEHb6sgGBsKgahjpO9
         KnIOEuxbCpCsNrrVQjoKg4643KFlecy5d/Fa2FXlu3lYrnO5HykyEv9YwjphBhNE3xi4
         whGt+BqWfKGND6z9QK6ALxpncTo3FeUMAn1HyYDwFFG9aPzrYeWg0fUhIo6h/OZWJf1J
         cMjYsqwDsWDBAfQXua5M9ByME0P2loAEa1/fDHYZsJ8d22+VGoKxfzBlDVsgtlUX63sR
         eVsg==
X-Forwarded-Encrypted: i=1; AJvYcCUCk1EvbbP3CDYlBr9DWqPpA1nnPhF7yRscwR/12gnkJj3zThA4I88uIGsL4ZHYEKpv3h4hNCPBr7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+NQoHn0SY1y554fxzpqVwbfLT+bQhKGK6eDWnmElzrYDVLCBR
	zv0Sa+GTe6AMfgjkOB9inIDeGhDW33LRD853HaTkim58LkQpw0Di89+1
X-Gm-Gg: AZuq6aJ7NDaYeuy++nfj8xIlodaD4Lz+RwEZfMXomYmrvHIT72bceeK734YLorXtULZ
	lNfkHoBHssO0xjn7XiH8GJzPrK6bKUrNIM4Yxjbn4+oOQAifpyyRSK1IDTtqkJMlyzI02kvgYKe
	Ii3wFfI4hFp29RNmQ+EAqStqJ0FCVFqurVHTLh+5KjmXhhupyENwg3lf6sCpstRuFIyzJ/I442a
	QfWu9iS4S7vzP/UbkL/OJH+1klopN1ILpK8kium6iovghveG9zZN5ZYqdNPXfoCTa0iCTJD1AT5
	AR/ZGdSe4RuotlHLcs3pzR+xF9JvJnZ/9uKLSUnhpFz8uyIU99w9E+o/qtAvSwPvAs+DXDYgBw7
	Zpq6PZrMorGU+8xYhHfZoKVVtjjbevGo2IeSt1yyV+oQ0VmayghLtMBbGpnbeeZtUrZzaClI3Zx
	wmHP40NGhAluOGvWZKaKMfcop7KD+OPCvkNRqMiA0hghrPC51B3g==
X-Received: by 2002:a05:600c:3553:b0:477:9976:9e1a with SMTP id 5b1f17b1804b1-483201dc5bamr123026275e9.6.1770563132478;
        Sun, 08 Feb 2026 07:05:32 -0800 (PST)
Received: from DB-VM.1337.ma ([197.230.240.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483206cc7d3sm179326255e9.5.2026.02.08.07.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 07:05:32 -0800 (PST)
From: Taha Ed-Dafili <0rayn.dev@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees-archive@lists.linuxfoundation.org,
	nuno.sa@analog.com,
	andy@kernel.org,
	corbet@lwn.net,
	lars@metafoo.de,
	Michael.Hennerich@analog.com,
	linux-iio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taha Ed-Dafili <0rayn.dev@gmail.com>
Subject: [PATCH v3 2/4] iio: core: Add IIO_EV_INFO_SCALE to event info
Date: Sun,  8 Feb 2026 10:05:03 -0500
Message-ID: <20260208150515.14798-3-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260208150515.14798-1-0rayn.dev@gmail.com>
References: <20260208150515.14798-1-0rayn.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[baylibre.com,infradead.org,linuxfoundation.org,lists.linuxfoundation.org,analog.com,kernel.org,lwn.net,metafoo.de,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-75624-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[0rayndev@gmail.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A022D109088
X-Rspamd-Action: no action

Implement support for IIO_EV_INFO_SCALE in the internal enum
iio_event_info to allow proper ABI compliance.

This allows drivers (like the ADXL345) to expose event scale
attributes using the standard IIO ABI rather than manual
device attributes.

Signed-off-by: Taha Ed-Dafili <0rayn.dev@gmail.com>
---
 drivers/iio/industrialio-event.c | 1 +
 include/linux/iio/types.h        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/iio/industrialio-event.c b/drivers/iio/industrialio-event.c
index 06295cfc2da8..5096baf233f0 100644
--- a/drivers/iio/industrialio-event.c
+++ b/drivers/iio/industrialio-event.c
@@ -256,6 +256,7 @@ static const char * const iio_ev_info_text[] = {
 	[IIO_EV_INFO_TAP2_MIN_DELAY] = "tap2_min_delay",
 	[IIO_EV_INFO_RUNNING_PERIOD] = "runningperiod",
 	[IIO_EV_INFO_RUNNING_COUNT] = "runningcount",
+	[IIO_EV_INFO_SCALE] = "scale",
 };
 
 static enum iio_event_direction iio_ev_attr_dir(struct iio_dev_attr *attr)
diff --git a/include/linux/iio/types.h b/include/linux/iio/types.h
index 34eebad12d2c..4e3099defc1d 100644
--- a/include/linux/iio/types.h
+++ b/include/linux/iio/types.h
@@ -21,6 +21,7 @@ enum iio_event_info {
 	IIO_EV_INFO_TAP2_MIN_DELAY,
 	IIO_EV_INFO_RUNNING_PERIOD,
 	IIO_EV_INFO_RUNNING_COUNT,
+	IIO_EV_INFO_SCALE,
 };
 
 #define IIO_VAL_INT 1
-- 
2.47.3


