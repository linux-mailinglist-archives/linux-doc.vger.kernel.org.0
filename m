Return-Path: <linux-doc+bounces-43721-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F82A953ED
	for <lists+linux-doc@lfdr.de>; Mon, 21 Apr 2025 18:17:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9744D188EA6D
	for <lists+linux-doc@lfdr.de>; Mon, 21 Apr 2025 16:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4E501DEFE8;
	Mon, 21 Apr 2025 16:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ex8v9B/U"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04ACC19CD1D
	for <linux-doc@vger.kernel.org>; Mon, 21 Apr 2025 16:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745252252; cv=none; b=LSS2zUhhGBzDcXCtuWB0Q9KFgC19+zwv7pPkgdRJVKorMxjrDEoSggMciQ3JNLePjl88Fl5/z6uRUGzbHpQ2hlmjSgqMbFw9/1zAjBgADb8c/ka/ZMdRbN7zIjiUkBdMUemBhnB3F/3hwltaZ6v72Zb5sdpgjxR8FjmaxdzEm8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745252252; c=relaxed/simple;
	bh=1Mxdzu3Dy35vNGbmZ1vQdpiZUkKpIxDbzfQOEgcte8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O/YWUBAs25r/cL8jJgORbcd2i7yGzWwE6xbwvDENkvW6iYJuQlNcvLRgMEY9isoxchZhbKWY6f6ohS/zQIa4Q69cjrWeYmyA41DnmbENcyiYjsoPBL3XQ80X5fRGLDhIwgFBhS0Gqvjm+vPKUSExOcf3PyTlxuNuORt4wm9A5uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ex8v9B/U; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745252249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AxyLW5sq+o6vn0oRNHNlsA+8mL41449UYQjhSR/iYXk=;
	b=Ex8v9B/UGzNppCN3aPA6+7FekSUkSOVp0QPSXo72czsrxbFgNp0qqe6r+QyvXcU9GC0xgu
	dZB5etw3Tdu+HNaPYnrMLMOXT6oxh0CwYaamIqcim191IG4uBcryNNLXSVS0VQNJIqcryK
	ofSThoKQC5wIa4pn2mY0RzWUbE9nmZE=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-647-xSX_DSPfMgS-vDxGLqpAcA-1; Mon,
 21 Apr 2025 12:17:28 -0400
X-MC-Unique: xSX_DSPfMgS-vDxGLqpAcA-1
X-Mimecast-MFC-AGG-ID: xSX_DSPfMgS-vDxGLqpAcA_1745252247
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0C0191956088;
	Mon, 21 Apr 2025 16:17:27 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.65.113])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0AFC430001A2;
	Mon, 21 Apr 2025 16:17:25 +0000 (UTC)
From: Joel Savitz <jsavitz@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Joel Savitz <jsavitz@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: [PATCH v3] docs: namespace: Tweak and reword resource control doc
Date: Mon, 21 Apr 2025 12:17:23 -0400
Message-ID: <20250421161723.1138903-1-jsavitz@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Fix the document title and reword the phrasing to active voice.

Signed-off-by: Joel Savitz <jsavitz@redhat.com>
---
Changes since v2:
- Fix another typo
Changes since v1:
- Fix spelling of resource

 .../namespaces/resource-control.rst           | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/Documentation/admin-guide/namespaces/resource-control.rst b/Documentation/admin-guide/namespaces/resource-control.rst
index 369556e00f0c..553a44803231 100644
--- a/Documentation/admin-guide/namespaces/resource-control.rst
+++ b/Documentation/admin-guide/namespaces/resource-control.rst
@@ -1,17 +1,17 @@
-===========================
-Namespaces research control
-===========================
+====================================
+User namespaces and resource control
+====================================
 
-There are a lot of kinds of objects in the kernel that don't have
-individual limits or that have limits that are ineffective when a set
-of processes is allowed to switch user ids.  With user namespaces
-enabled in a kernel for people who don't trust their users or their
-users programs to play nice this problems becomes more acute.
+The kernel contains many kinds of objects that either don't have
+individual limits or that have limits which are ineffective when
+a set of processes is allowed to switch their UID. On a system
+where the admins don't trust their users or their users' programs,
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


