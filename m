Return-Path: <linux-doc+bounces-18691-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE8490A74F
	for <lists+linux-doc@lfdr.de>; Mon, 17 Jun 2024 09:35:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A4BA2874FA
	for <lists+linux-doc@lfdr.de>; Mon, 17 Jun 2024 07:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C46318C33B;
	Mon, 17 Jun 2024 07:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ealPVXtB"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB869191473
	for <linux-doc@vger.kernel.org>; Mon, 17 Jun 2024 07:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718609615; cv=none; b=dpoc1gm11GrFKYAKSc+cJqnG1XV9CPwqx/uHHP7zVXqqc+9HEH/D12l5rHYsJNuHko1zfaYFIJO2MtwPbllFbnmvpcNBsxOREHIV55zSZNwskx9n8sXma6c5vBojuNxFahYCqkp3/fpSurof6Kf80XxrpbCx8wYg6CRUJEd5Cww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718609615; c=relaxed/simple;
	bh=6Be1VBuJBuQx5WhlORRWbQbz/9PnkOafd1jCoOL3EyY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L30Fb7HLxbUL2BwD+uY9VmD2G/lPMy1f9/exITZVUWtu2gFBhVWpaWZh3+bXTcz8XYpTXcTS/A0T6hU6KqeX2jV5JNf2BfDmojp0c42Ir2i8BD/BSSlmXq0nyznlwHl7rdMOpYEKVUEw901Yb2X9hKQSLXReWm/XKaOnnxrJI+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ealPVXtB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718609612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VGyu5AtFOjrYW0RzXt8zeng+1SKzDJmAJ+4VL1VE6fw=;
	b=ealPVXtBqE51+lBpSiBX7pV7OgTc9t3Ja5rbH++lJgg84tydnCbn6jsgOqMbyOgFIAk88J
	M8TmldMC24MAiin7ekHAoVZ/yWwYxTJteN01/vf/gNzDkQ5z0kZWkaFPl69SJ4dOfVJ95W
	aBfCKP8rw16stUBYoHPcigqeem0UWJM=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-586-uM0S3oo2On6hmLCXvq3YQA-1; Mon,
 17 Jun 2024 03:33:30 -0400
X-MC-Unique: uM0S3oo2On6hmLCXvq3YQA-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D64B819560B3;
	Mon, 17 Jun 2024 07:33:28 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.120])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 068F31956087;
	Mon, 17 Jun 2024 07:33:24 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: linux-doc@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Cc: linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Adrian Bunk <bunk@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-block@vger.kernel.org
Subject: [PATCH] Documentation: Remove the unused "tp720" from kernel-parameters.txt
Date: Mon, 17 Jun 2024 09:33:22 +0200
Message-ID: <20240617073322.40679-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

The "tp720" switch once belonged to the ps2esdi driver, but this
driver has been removed a long time ago in 2008 in the commit
2af3e6017e53 ("The ps2esdi driver was marked as BROKEN more than two years ago due to being no longer working for some time.")
already, so let's remove it from the documentation now, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index b75852f1a789..89b784ec5ab1 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6619,8 +6619,6 @@
 	torture.verbose_sleep_duration= [KNL]
 			Duration of each verbose-printk() sleep in jiffies.
 
-	tp720=		[HW,PS2]
-
 	tpm_suspend_pcr=[HW,TPM]
 			Format: integer pcr id
 			Specify that at suspend time, the tpm driver
-- 
2.45.2


