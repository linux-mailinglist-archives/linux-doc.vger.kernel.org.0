Return-Path: <linux-doc+bounces-43591-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4E1A939A5
	for <lists+linux-doc@lfdr.de>; Fri, 18 Apr 2025 17:29:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F0E88A2E74
	for <lists+linux-doc@lfdr.de>; Fri, 18 Apr 2025 15:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0C98211476;
	Fri, 18 Apr 2025 15:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YjN2GphT"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20E121127E
	for <linux-doc@vger.kernel.org>; Fri, 18 Apr 2025 15:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744990161; cv=none; b=mXk4epIDTMgjhwHoabeTJKd2eCOIsYbeP2ld3gB4NXKWRFRtW9TIapgvqf239JMbBgFKTewF5PJmGlWwVt/WrYCbmijdLChsJxLzeYnWwonda93koNwnH1iM4sr5aOqW5y/O4sXvdzI94QvViTPKSdH8+DPO9bpt7T0MsN1cCVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744990161; c=relaxed/simple;
	bh=yhg61Z5FgdpTqeKa66MzWE8kZ0brp5lJvNYoMhx0bKU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LMhgEbCUvY7P2DeDoZZpzJJWp/84ztcbgi5L+wsUiESJ/7UnsXsN5sqd6mD0PlqqCetdzs4s41MqXwPb+PnDABqkp4hYmFElqH1YGJ1Pur5stAo4nhIfncc/Ki2PLp8dRSVmQKRBaNkRJc/liAkdMs3jCbbT4RShzgU9Vbs+Ufc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YjN2GphT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744990158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EBkbeEOM4+zmvVxiJ3s2YnpGyrudvKTNT92Qch4FMKk=;
	b=YjN2GphTsqivsD+xmXSErEXDEo8lXgx6tHQloN7ogHkxjkb8YhizgM8U9LjdxL/db5mPV+
	wQULYdSMtNwfjxOo41Hbc9u/XvEgMloRWI8RPIBKUUw6wg+x2hoqJ+2BmyLR8RcjT6qoxW
	X2+mm5D/gsXM8TG036VpcAs5GkCBY1k=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-395-osmMWsiJPxWyysTSjw8FUw-1; Fri,
 18 Apr 2025 11:29:17 -0400
X-MC-Unique: osmMWsiJPxWyysTSjw8FUw-1
X-Mimecast-MFC-AGG-ID: osmMWsiJPxWyysTSjw8FUw_1744990156
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 789031956088;
	Fri, 18 Apr 2025 15:29:16 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.89.24])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 77CBC1800965;
	Fri, 18 Apr 2025 15:29:15 +0000 (UTC)
From: Joel Savitz <jsavitz@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Joel Savitz <jsavitz@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs: namespace: Tweak and reword resource control doc
Date: Fri, 18 Apr 2025 11:29:10 -0400
Message-ID: <20250418152910.1121670-1-jsavitz@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Fix the document title and reword the phrasing to active voice.

Signed-off-by: Joel Savitz <jsavitz@redhat.com>
---
 .../namespaces/resource-control.rst           | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/Documentation/admin-guide/namespaces/resource-control.rst b/Documentation/admin-guide/namespaces/resource-control.rst
index 369556e00f0c..624f4dceea46 100644
--- a/Documentation/admin-guide/namespaces/resource-control.rst
+++ b/Documentation/admin-guide/namespaces/resource-control.rst
@@ -1,17 +1,17 @@
-===========================
-Namespaces research control
-===========================
+====================================
+User namespaces and resoruce control
+====================================
 
-There are a lot of kinds of objects in the kernel that don't have
-individual limits or that have limits that are ineffective when a set
-of processes is allowed to switch user ids.  With user namespaces
-enabled in a kernel for people who don't trust their users or their
-users programs to play nice this problems becomes more acute.
+The kernel contains many kinds of objects that either don't have
+individual limits or that have limits which are ineffective when
+a set of processes is allowed to switch their UID. On a system
+where there admins don't trust their users or their users' programs,
+user namespaces expose the system to potential misuse of resources.
 
-Therefore it is recommended that memory control groups be enabled in
-kernels that enable user namespaces, and it is further recommended
-that userspace configure memory control groups to limit how much
-memory user's they don't trust to play nice can use.
+In order to mitigate this, we recommend that admins enable memory
+control groups on any system that enables user namespaces.
+Furthermore, we recommend that admins configure the memory control
+groups to limit the maximum memory usable by any untrusted user.
 
 Memory control groups can be configured by installing the libcgroup
 package present on most distros editing /etc/cgrules.conf,
-- 
2.45.2


