Return-Path: <linux-doc+bounces-86388-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCw0O4Gz/WkrhwAAu9opvQ
	(envelope-from <linux-doc+bounces-86388-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 08 May 2026 11:57:21 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 585244F4941
	for <lists+linux-doc@lfdr.de>; Fri, 08 May 2026 11:57:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A277030A0EB4
	for <lists+linux-doc@lfdr.de>; Fri,  8 May 2026 09:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53F3D3C061D;
	Fri,  8 May 2026 09:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d/E3ZjCt"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A2C36166F;
	Fri,  8 May 2026 09:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778233956; cv=none; b=LmWNkBAe9tEvbUG5PYgFuw8WamL66wY0+QnzJXW2VlZ0M1k59pbZt+06STKS3/7ZJ9781cODr3X/EtJ0n9pQeKloIHtCW48E33BJjtTTRFxuUvNfdrsEY174Qd6OnT2JFebsJV7m5aa+ogXScW5XgLYOjMHZeHDUuMEu4Urs37g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778233956; c=relaxed/simple;
	bh=D6Oq7DLPu56l3hmfaRGCGWQ99InkPvPxeB2LIoMUtws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EaWtaK98Gz/Pu0TiUsjzQTmsjtusqy2JoYXfZiyQ3n2dqGRBOyjRA42VgYDyOambfWS6vbug4nU5GNNyg+MwipAeUJCZr5pPGojelg6VmFGNGe8xNaLensyiJTuKyzEtJnqVeqQ1e7nmbd+fKLlyn5jG/lSuVwDLBwHSC2ywgOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d/E3ZjCt; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778233954; x=1809769954;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D6Oq7DLPu56l3hmfaRGCGWQ99InkPvPxeB2LIoMUtws=;
  b=d/E3ZjCt3Z5SVTqTTD6TtjFRj6/d717Py8lZ8zdBulyWGOQTFRida9m0
   az9k2MmNSQ0eqXfJSZ3IdkXtJf3DX3SB5/YvzTsMaOOOTpMZ2qFrUw9tg
   AmWFsvOdJK2ehaE91B5HobJP+gO3pDCE20f+EdF4niZLPGmwfGzTfnSyb
   k27KkxIUJ2Z6ldeej5RdqFcVlBFHqpC6n231kTofH4eVqQcFfmtV1GYMq
   655uiHmXjGXM/gIxe6Gt75icBa4+eFkaWRRuujbItF/RDrk6+yRjkwmhd
   /P1CtYfWIRIgdwQaSYBgt/uLeuAHA3AalUesVSYO/hVbW8eUlWSLDBBYP
   Q==;
X-CSE-ConnectionGUID: vcNupSpURTakuspV36Hzvw==
X-CSE-MsgGUID: PfINW0B2SYOqYZnG0BjOmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="104659518"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="104659518"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 02:52:32 -0700
X-CSE-ConnectionGUID: bvjmTYeQTLWB045fgO31Pw==
X-CSE-MsgGUID: EdfbYp0QTNiTpqK7VIAK5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="235740001"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 08 May 2026 02:52:30 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 5326B9B; Fri, 08 May 2026 11:52:28 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	driver-core@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-spi@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>
Subject: [PATCH v1 2/4] spi: Support suppress_override_attrs flag
Date: Fri,  8 May 2026 11:42:40 +0200
Message-ID: <20260508095224.1275645-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260508095224.1275645-1-andriy.shevchenko@linux.intel.com>
References: <20260508095224.1275645-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 585244F4941
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-86388-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:email,intel.com:dkim]
X-Rspamd-Action: no action

Some device driver may want to suppress the driver_override sysfs attribute
by specifying a certain flag in their struct device_driver. Since SPI uses
explicit attribute instantiation, add that support here.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 5f57de24b9f7..40e738f8cbb7 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -214,8 +214,19 @@ static struct attribute *spi_dev_attrs[] = {
 	NULL,
 };
 
+static umode_t spi_dev_attr_is_visible(struct kobject *kobj, struct attribute *attr, int i)
+{
+	struct device *dev = kobj_to_dev(kobj);
+
+	if (attr == &dev_attr_driver_override.attr)
+		return dev->driver->suppress_override_attrs ? 0 : attr->mode;
+
+	return attr->mode;
+}
+
 static const struct attribute_group spi_dev_group = {
 	.attrs  = spi_dev_attrs,
+	.is_visible	= spi_dev_attr_is_visible,
 };
 
 static struct attribute *spi_device_statistics_attrs[] = {
-- 
2.50.1


