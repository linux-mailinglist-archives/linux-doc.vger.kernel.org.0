Return-Path: <linux-doc+bounces-43620-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17070A9441A
	for <lists+linux-doc@lfdr.de>; Sat, 19 Apr 2025 17:04:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A47271892591
	for <lists+linux-doc@lfdr.de>; Sat, 19 Apr 2025 15:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56FBC1DDA09;
	Sat, 19 Apr 2025 15:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G38WiR+H"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F1C78F5D
	for <linux-doc@vger.kernel.org>; Sat, 19 Apr 2025 15:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745075079; cv=none; b=ARDuvKnPwqYmvSvC28N4BmVmRI7YI3XESOS9bB4sGhOHl/gDYlpjVoVbuYQLmZk3d8p/O5lf0V1y16rLRxSIX71Brigt25/j1JPVWHCvslPTEJ0rSPh1VFwNUWwV9pk0wBmkGyM8FDgArs1OXY+ip5aaYkPalcHn9HXLBew2Gog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745075079; c=relaxed/simple;
	bh=KT6+zD1kiIB+LKQqAB5iiWkSwIi/9XAVFeUDVvZIFHs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pVSD6bcl/0WtoRfEpx63v046lUknInWnctLn0Z63bPZ02ID7mw7wYMVluoTEsVPAZcY9nuhz8y18y5I6iZMDRckKuy58HaLAwqJOIkEYrVCZMjjEQtwLrXOzQ0pCviLjjnvNXxcXB1hzup/Osvnx6OvXx/4XgjN56B9H9n+ffVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G38WiR+H; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745075075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=B2b52dp/7QUNWm70nZpu4N1OWTh6Lfw+QpUQkzTr6A8=;
	b=G38WiR+HPKZEIGWpXXE99PJe6KcIy27qqh+wsM0gf6vgOLfjf7qUPRO2NT1HROmbhmzg1U
	WR0wUwUiulCGadiHcJeTDmgadZqCOm4wIhOapWw+W7wcZkTVcR/oIzrIOmlDmYM2TxJd1j
	1ZsuDTUFtr/tQVpaxuK7jc/AYOQMj7I=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-553-88CWU5ZEMc6C5IuROEeZyA-1; Sat,
 19 Apr 2025 11:04:31 -0400
X-MC-Unique: 88CWU5ZEMc6C5IuROEeZyA-1
X-Mimecast-MFC-AGG-ID: 88CWU5ZEMc6C5IuROEeZyA_1745075071
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DC7CE1956086;
	Sat, 19 Apr 2025 15:04:30 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.89.24])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6B063180175B;
	Sat, 19 Apr 2025 15:04:29 +0000 (UTC)
From: Joel Savitz <jsavitz@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Joel Savitz <jsavitz@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: [PATCH v2] docs: namespace: Tweak and reword resource control doc
Date: Sat, 19 Apr 2025 11:04:28 -0400
Message-ID: <20250419150428.1129352-1-jsavitz@redhat.com>
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
Changes since v1:
- Fix spelling of resource

 .../namespaces/resource-control.rst           | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/Documentation/admin-guide/namespaces/resource-control.rst b/Documentation/admin-guide/namespaces/resource-control.rst
index 369556e00f0c..350134c26a98 100644
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


