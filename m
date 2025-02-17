Return-Path: <linux-doc+bounces-37966-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F009A3491D
	for <lists+linux-doc@lfdr.de>; Thu, 13 Feb 2025 17:09:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 671211892260
	for <lists+linux-doc@lfdr.de>; Thu, 13 Feb 2025 16:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA59C1FBC9C;
	Thu, 13 Feb 2025 16:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YMd8sZz5"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA68159596
	for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2025 16:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739462878; cv=none; b=AduhvqSELx1xgE7Ks5MPi6vM+aQ/znKF0Ow4VajJEWAi5blM9VS0lZQnKfCN/l1+vwyMazZ8pqWgRlQ2vqzO32dUz0lN0d72Q/ZpbprKeoBW1tMSP7O+f0P84IJtZ61F8hT20XoqzuTfX8/6RqixbvddtlwlJR4VEb2wqSROK/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739462878; c=relaxed/simple;
	bh=9z9ly0MkvstCsMS6aW9S4hYWRLcjStxsj2nkyRaXFo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VoJUbB5Js6/4ZdI2qEWGDHo+9TEetT3Hje95Myg30WJSYI6OZbikUecatMkY6vAXa0v5atbl7w4Wq439jFKNzwo9bxrxzaBHR/ma0JHRnjGUnYa5uxAqI4iLS8yt8eogcT13GMjBo/SzERMk72dN8JoxyeJUToJzaa5uLVJTMGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YMd8sZz5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739462875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YOndX9M5WfO42H/bYxj/1RyY5alxlO8+Byt5OCQCP/E=;
	b=YMd8sZz5W0ue+x3GBVHxKB+/Z8y46VvgmkBGvFsCbnwqiqcLOOr6sotS1vTC56W5qGGIBX
	bOnTT5Xkhyf+e5PJESgkjsC2waqBurRTSv9Fi/mVg/b+s/gV1U9pYsB7YSg5S+v/fZP7xH
	4QjRkoCBK1ph+TgD/NxQzA4OodOPZMI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-504-jg1GiRpmNW2svPeZTw-YRA-1; Thu,
 13 Feb 2025 11:07:47 -0500
X-MC-Unique: jg1GiRpmNW2svPeZTw-YRA-1
X-Mimecast-MFC-AGG-ID: jg1GiRpmNW2svPeZTw-YRA
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 17421180087C;
	Thu, 13 Feb 2025 16:07:46 +0000 (UTC)
Received: from dba-icx.bos.redhat.com (prarit2023-dbaguest.khw.eng.bos2.dc.redhat.com [10.26.1.94])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 50BC819373C4;
	Thu, 13 Feb 2025 16:07:44 +0000 (UTC)
From: David Arcari <darcari@redhat.com>
To: linux-pm@vger.kernel.org
Cc: David Arcari <darcari@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Jacob Pan <jacob.jun.pan@linux.intel.com>,
	Len Brown <lenb@kernel.org>,
	Artem Bityutskiy <dedekind1@gmail.com>,
	Prarit Bhargava <prarit@redhat.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] intel_idle: introduce 'no_native' module parameter
Date: Thu, 13 Feb 2025 11:07:41 -0500
Message-ID: <20250213160741.445351-1-darcari@redhat.com>
In-Reply-To: <20250128141139.2033088-1-darcari@redhat.com>
References: <20250128141139.2033088-1-darcari@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Since commit 18734958e9bf ("intel_idle: Use ACPI _CST for processor models
without C-state tables") the intel_idle driver has had the ability to use
the ACPI _CST to populate C-states when the processor model is not
recognized. However, even when the processor model is recognized (native
mode) there are cases where it is useful to make the driver ignore the per
cpu idle states in lieu of ACPI C-states (such as specific application
performance). Add the 'no_native' module parameter to provide this
functionality.

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: Len Brown <lenb@kernel.org>
Cc: David Arcari <darcari@redhat.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Prarit Bhargava <prarit@redhat.com>
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: David Arcari <darcari@redhat.com>
---
v4: fix !CONFIG_ACPI_PROCESSOR_CSTATE compilation issue
v3: more documentation cleanup
v2: renamed parameter, cleaned up documentation

Documentation/admin-guide/pm/intel_idle.rst | 18 +++++++++++++-----
 drivers/idle/intel_idle.c                   | 16 ++++++++++++++++
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/pm/intel_idle.rst b/Documentation/admin-guide/pm/intel_idle.rst
index 39bd6ecce7de..5940528146eb 100644
--- a/Documentation/admin-guide/pm/intel_idle.rst
+++ b/Documentation/admin-guide/pm/intel_idle.rst
@@ -192,11 +192,19 @@ even if they have been enumerated (see :ref:`cpu-pm-qos` in
 Documentation/admin-guide/pm/cpuidle.rst).
 Setting ``max_cstate`` to 0 causes the ``intel_idle`` initialization to fail.
 
-The ``no_acpi`` and ``use_acpi`` module parameters (recognized by ``intel_idle``
-if the kernel has been configured with ACPI support) can be set to make the
-driver ignore the system's ACPI tables entirely or use them for all of the
-recognized processor models, respectively (they both are unset by default and
-``use_acpi`` has no effect if ``no_acpi`` is set).
+The ``no_acpi``, ``use_acpi`` and ``no_native`` module parameters are
+recognized by ``intel_idle`` if the kernel has been configured with ACPI
+support.  In the case that ACPI is not configured these flags have no impact
+on functionality.
+
+``no_acpi`` - Do not use ACPI at all.  Only native mode is available, no
+ACPI mode.
+
+``use_acpi`` - No-op in ACPI mode, the driver will consult ACPI tables for
+C-states on/off status in native mode.
+
+``no_native`` - Work only in ACPI mode, no native mode available (ignore
+all custom tables).
 
 The value of the ``states_off`` module parameter (0 by default) represents a
 list of idle states to be disabled by default in the form of a bitmask.
diff --git a/drivers/idle/intel_idle.c b/drivers/idle/intel_idle.c
index 118fe1d37c22..b0be5ef43ffc 100644
--- a/drivers/idle/intel_idle.c
+++ b/drivers/idle/intel_idle.c
@@ -1695,6 +1695,10 @@ static bool force_use_acpi __read_mostly; /* No effect if no_acpi is set. */
 module_param_named(use_acpi, force_use_acpi, bool, 0444);
 MODULE_PARM_DESC(use_acpi, "Use ACPI _CST for building the idle states list");
 
+static bool no_native __read_mostly; /* No effect if no_acpi is set. */
+module_param_named(no_native, no_native, bool, 0444);
+MODULE_PARM_DESC(no_native, "Ignore cpu specific (native) idle states in lieu of ACPI idle states");
+
 static struct acpi_processor_power acpi_state_table __initdata;
 
 /**
@@ -1834,6 +1838,11 @@ static bool __init intel_idle_off_by_default(unsigned int flags, u32 mwait_hint)
 	}
 	return true;
 }
+
+static inline bool ignore_native(void)
+{
+	return no_native & !no_acpi;
+}
 #else /* !CONFIG_ACPI_PROCESSOR_CSTATE */
 #define force_use_acpi	(false)
 
@@ -1843,6 +1852,7 @@ static inline bool intel_idle_off_by_default(unsigned int flags, u32 mwait_hint)
 {
 	return false;
 }
+static inline bool ignore_native(void) { return false; }
 #endif /* !CONFIG_ACPI_PROCESSOR_CSTATE */
 
 /**
@@ -2328,6 +2338,12 @@ static int __init intel_idle_init(void)
 	pr_debug("MWAIT substates: 0x%x\n", mwait_substates);
 
 	icpu = (const struct idle_cpu *)id->driver_data;
+	if (ignore_native()) {
+		if (icpu) {
+			pr_debug("ignoring native cpu idle states\n");
+			icpu = NULL;
+		}
+	}
 	if (icpu) {
 		if (icpu->state_table)
 			cpuidle_state_table = icpu->state_table;
-- 
2.48.1


