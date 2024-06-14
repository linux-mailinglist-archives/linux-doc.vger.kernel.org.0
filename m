Return-Path: <linux-doc+bounces-18627-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D5F90926F
	for <lists+linux-doc@lfdr.de>; Fri, 14 Jun 2024 20:41:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D494E28D38E
	for <lists+linux-doc@lfdr.de>; Fri, 14 Jun 2024 18:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7614419EEAA;
	Fri, 14 Jun 2024 18:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GVrChCbn"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F351719ADB3
	for <linux-doc@vger.kernel.org>; Fri, 14 Jun 2024 18:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718390458; cv=none; b=p6crV4sV78dS3sNDnx5Qx9oJVp77P7qB7R/U6TwSvmXIgs9lAPUpc6IcFpMDW7QQJq1O+Rbz4hxSdWIR4pjSBJfovcFYgP7JVivAlCmMrXzjHRUS4cIoD9CMCcSpn3doIbKjubuqdPnsEmkmYnM3VJdIau/uLxCTpfKfzQTHXtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718390458; c=relaxed/simple;
	bh=ULzJwpglCX0QEdR3Y1XsB3aWzDUVENMbvB8wSVJ9pJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nU4+u58TlwE3XE9HAGzuR0unz4NhmguHdraP8Tk5CH/4j+ZUzZ5rGEfmAXN1t4AgWy+fd4uX/jfs+SvLhBlZ62O/bkoq9riWwHqJDa/aToSA1tK8GDYUYAYTiPT4Dy4032kC1kgR/USxQhtOdjHtIVqXUym7AR/LmMSGvsGwYEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GVrChCbn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718390456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vbHnjVCMgPLHGeY6k4yg5XvdLWsbsFGovk2aBHxfGoc=;
	b=GVrChCbn79UlwWNBXKYGvbIlL27670k0ZTFfQtqd86yMsYNYmhLmTw02DpY39TjSQqXaI6
	8L/1WfmgjYcHRUHs4tFOvFGpGe8q1G9EMT0aYHmVLLAeRCeJ1xf0Rho60QaWWGKilTyRE0
	+PgiKvJkE3hKiSBDdOKWa1di5KggWz8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-541-nA-l2EvuNieQ2sPCHOqdTg-1; Fri,
 14 Jun 2024 14:40:50 -0400
X-MC-Unique: nA-l2EvuNieQ2sPCHOqdTg-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6D3861956083;
	Fri, 14 Jun 2024 18:40:48 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.193.73])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D570F19560AA;
	Fri, 14 Jun 2024 18:40:42 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: linux-doc@vger.kernel.org,
	Alexander Shiyan <shc_work@mail.ru>,
	Olof Johansson <olof@lixom.net>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-mtd@lists.infradead.org
Subject: [PATCH] Documentation: Remove unused "spia_*" kernel parameters
Date: Fri, 14 Jun 2024 20:40:41 +0200
Message-ID: <20240614184041.601056-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

The kernel module parameters "spia_io_base", "spia_fio_base",
"spia_pedr" and "spia_peddr" have been removed via commit e377ca1e32f6
("ARM: clps711x: p720t: Special driver for handling NAND memory is removed").
Time to remove them from the documentation now, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index ff02e1a02e12..dd8436c98735 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6273,11 +6273,6 @@
 			Not specifying this option is equivalent to
 			spec_store_bypass_disable=auto.
 
-	spia_io_base=	[HW,MTD]
-	spia_fio_base=
-	spia_pedr=
-	spia_peddr=
-
 	split_lock_detect=
 			[X86] Enable split lock detection or bus lock detection
 
-- 
2.45.2


