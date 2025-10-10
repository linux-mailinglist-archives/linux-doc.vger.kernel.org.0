Return-Path: <linux-doc+bounces-62916-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B6230BCC261
	for <lists+linux-doc@lfdr.de>; Fri, 10 Oct 2025 10:34:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3F07834D88B
	for <lists+linux-doc@lfdr.de>; Fri, 10 Oct 2025 08:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7427A269B1C;
	Fri, 10 Oct 2025 08:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NQVZ5DD5"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0431265621
	for <linux-doc@vger.kernel.org>; Fri, 10 Oct 2025 08:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760085268; cv=none; b=gKvoflL9fACI5k435aFD7yZD5eHp0kXre7T7wj0ovjbdkCA+xu+7fvMMnpbnZ5Duxot0q4xLdqfrUIocRPzR2akjPUGIWYkP5S19PnX2/0ETAd2VV5zZvJ9zK517yNHl+6dL5nc1omyP3HeF2IufXrWYNNdi/GabtrrZplm9p4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760085268; c=relaxed/simple;
	bh=5dp9gHHafiY47COjYH/uTIdosRY3xR3odqfStfd8B9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Licu2EIbHl+oNVxdknF9RkST19vN548Aq1JNx3QTmjoV9c6Hb1CS8ntkjW6mOFgAnwhpBYwhEr9+sd3BELm29aoNSr1RCZfRKl4ulYkzWWKFhn4JGP0A5qmF9dZYVHEycAPAp75QxhIdDKEYoZque+kTFKwYLxpuEiJy2awVuuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NQVZ5DD5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760085266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PSmd414kfxWFanvw2RmfmmnBMl3rOzxPmcQQgrVQe3g=;
	b=NQVZ5DD5ToKMO4UiBnXytRMfGZ9IMiexwRif6U+7XHGQVzc31BPra/rsVzRIy7PhgYnrFN
	deSnKqzsMb5TjNH7NyCANQ7EgWALgqUYQk4e0tHI232lpOBkspcnLLwILsdkUl02ngraRz
	TVREeSXoX4pgTR0Ap9Qsufih1nyMOQw=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-572--wcduIO0P0SCE1Qo0av4QQ-1; Fri,
 10 Oct 2025 04:34:22 -0400
X-MC-Unique: -wcduIO0P0SCE1Qo0av4QQ-1
X-Mimecast-MFC-AGG-ID: -wcduIO0P0SCE1Qo0av4QQ_1760085261
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C4E7619560AE;
	Fri, 10 Oct 2025 08:34:20 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.32.197])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 56D5C19560BB;
	Fri, 10 Oct 2025 08:34:16 +0000 (UTC)
From: Tomas Glozar <tglozar@redhat.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	John Kacur <jkacur@redhat.com>,
	Luis Goncalves <lgoncalv@redhat.com>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Crystal Wood <crwood@redhat.com>,
	Attila Fazekas <afazekas@redhat.com>,
	Tomas Glozar <tglozar@redhat.com>
Subject: [PATCH 2/9] Documentation/rtla: Fix typo in common_timerlat_options.txt
Date: Fri, 10 Oct 2025 10:33:31 +0200
Message-ID: <20251010083338.478961-3-tglozar@redhat.com>
In-Reply-To: <20251010083338.478961-1-tglozar@redhat.com>
References: <20251010083338.478961-1-tglozar@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Fix "awakes" being used in place of "awakened" in --users-threads option
documentation.

Fixes: 612738321774 ("Documentation: Add tools/rtla timerlat -u option documentation")
Signed-off-by: Tomas Glozar <tglozar@redhat.com>
---
 Documentation/tools/rtla/common_timerlat_options.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/tools/rtla/common_timerlat_options.txt b/Documentation/tools/rtla/common_timerlat_options.txt
index 1f5d024b53aa..e7074eb36468 100644
--- a/Documentation/tools/rtla/common_timerlat_options.txt
+++ b/Documentation/tools/rtla/common_timerlat_options.txt
@@ -56,7 +56,7 @@
 **-u**, **--user-threads**
 
         Set timerlat to run without a workload, and then dispatches user-space workloads
-        to wait on the timerlat_fd. Once the workload is awakes, it goes to sleep again
+        to wait on the timerlat_fd. Once the workload is awakened, it goes to sleep again
         adding so the measurement for the kernel-to-user and user-to-kernel to the tracer
         output. **--user-threads** will be used unless the user specify **-k**.
 
-- 
2.51.0


