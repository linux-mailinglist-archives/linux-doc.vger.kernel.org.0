Return-Path: <linux-doc+bounces-40501-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 288FBA5C0CD
	for <lists+linux-doc@lfdr.de>; Tue, 11 Mar 2025 13:24:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D8BF189E550
	for <lists+linux-doc@lfdr.de>; Tue, 11 Mar 2025 12:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBCA52580C6;
	Tue, 11 Mar 2025 12:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XnWcnQs6"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0A62566FF
	for <linux-doc@vger.kernel.org>; Tue, 11 Mar 2025 12:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741695363; cv=none; b=LMUA436IJG1IG6xNCfipBi9jG8mgIS7uuEaVwIp80rqm24hcFLOubsOd0uKZ0OsBkkIOVf8hqK+SmeSCfvsl9OPTTHQKIOKWIzBJ/uvkt9ja4eyH8dhaSnFlcMF2CZr35PPEAJo6PqQODVwNToUpXRM2sMla/yoqcHwGH1QXugI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741695363; c=relaxed/simple;
	bh=X7fe/KCE3R83jzaOEowMszz74ZyVVbrDt8fCDhsHI/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dEdZJnpDK6L/s+fFR0VKVx/Iycd+3LzETXMT8PADWLt3Uw5cRJcAtb8JIvywSKvtnON8SgRW0d/IhNmJ7YDyLM8hgb8x97G42vuBsM8q5O6Zc2S/WTL/aR0EVrPE0RGV3AVdNSngvxV7Xa79Rp29N0pLaXQMp+Pl/EgRIMRUuiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XnWcnQs6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741695360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mV25w6Z2VILwnPpxh3QyTBBnTNpRR02wCzlDqrTTivo=;
	b=XnWcnQs6awieCNDFUyShEVLWkJ2lX5iN4xAn2ioGKGThaSg2W9BZ0Gh6pNCmcGKzX0xViG
	wz5JZBLbd5CIVXgnBJL2lHxf/XW0Zkp01AEhy6iBpWlNbP+FrYgyg9jx++JudqkzGIgHpm
	4xhDZc8e1nf6Sskm/dJ60aadl3Y21Zk=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-118-EC1_NSZZPM2EiCRw_wVJGQ-1; Tue,
 11 Mar 2025 08:15:59 -0400
X-MC-Unique: EC1_NSZZPM2EiCRw_wVJGQ-1
X-Mimecast-MFC-AGG-ID: EC1_NSZZPM2EiCRw_wVJGQ_1741695358
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4F79C19560AB;
	Tue, 11 Mar 2025 12:15:58 +0000 (UTC)
Received: from fedora.brq.redhat.com (unknown [10.43.17.52])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EDB381800944;
	Tue, 11 Mar 2025 12:15:55 +0000 (UTC)
From: Tomas Glozar <tglozar@redhat.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Kacur <jkacur@redhat.com>,
	Luis Goncalves <lgoncalv@redhat.com>,
	Tomas Glozar <tglozar@redhat.com>
Subject: [PATCH 1/4] Documentation/rtla: Fix duplicate text about timerlat tracer
Date: Tue, 11 Mar 2025 12:49:33 +0100
Message-ID: <20250311114936.148012-2-tglozar@redhat.com>
In-Reply-To: <20250311114936.148012-1-tglozar@redhat.com>
References: <20250311114936.148012-1-tglozar@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

A passage about how the timerlat tracer outputs information is included
in both common_timerlat_description.rst and rtla-timerlat.rst, leading
it to be displayed twice in the rtla-timerlat page.

Remove the duplicate passage from rtla-timerlat.rst.

Fixes: 29380d4055e5 ("rtla: Add rtla timerlat documentation")
Signed-off-by: Tomas Glozar <tglozar@redhat.com>
---
 Documentation/tools/rtla/rtla-timerlat.rst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/tools/rtla/rtla-timerlat.rst b/Documentation/tools/rtla/rtla-timerlat.rst
index 44a49e6f302b..b334fb00ba0e 100644
--- a/Documentation/tools/rtla/rtla-timerlat.rst
+++ b/Documentation/tools/rtla/rtla-timerlat.rst
@@ -16,9 +16,6 @@ DESCRIPTION
 
 .. include:: common_timerlat_description.rst
 
-The *timerlat* tracer outputs information in two ways. It periodically
-prints the timer latency at the timer *IRQ* handler and the *Thread* handler.
-It also provides information for each noise via the **osnoise:** tracepoints.
 The **rtla timerlat top** mode displays a summary of the periodic output
 from the *timerlat* tracer. The **rtla hist hist** mode displays a histogram
 of each tracer event occurrence. For further details, please refer to the
-- 
2.48.1


