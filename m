Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21CFC6D5617
	for <lists+linux-doc@lfdr.de>; Tue,  4 Apr 2023 03:30:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232846AbjDDBaN (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 3 Apr 2023 21:30:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232743AbjDDB31 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Apr 2023 21:29:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3319268E
        for <linux-doc@vger.kernel.org>; Mon,  3 Apr 2023 18:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680571711;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1l/vBoUEhgxsmLv104lwmJ8KryX+Oa0PJH6QLfzc/6M=;
        b=f3oTlt7OVF6UfUTeKAd8QsV8ISBpiTQy3ttPC94IbERoh7KzHRUm2D5gGOEaGG7B8pqJkL
        KjLmTh74kXOcWr8c1m+KJK3tftEYsVNMFckEDkuJDcdHBxlz5ag9UM4BdGlrttLExKugSm
        Qx04ot/UJp/WyYM47r4AVqWCmcpFKCs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-248-HNJE9cX8NjiTzcJg3SGERg-1; Mon, 03 Apr 2023 21:28:30 -0400
X-MC-Unique: HNJE9cX8NjiTzcJg3SGERg-1
Received: by mail-ed1-f70.google.com with SMTP id ev6-20020a056402540600b004bc2358ac04so44160678edb.21
        for <linux-doc@vger.kernel.org>; Mon, 03 Apr 2023 18:28:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680571709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1l/vBoUEhgxsmLv104lwmJ8KryX+Oa0PJH6QLfzc/6M=;
        b=vNiEcxgdmfSZPmyJdnPQQ9TfTnGSMEJ9bPQWpes6zEwfFGm8Q+KvZJj0fIeBmOpJmv
         ef5ymiPmpZsey8yqCKgO7L0UUAedtciH7LcYsN9y02TN8nB4VhOMTvMSedRdrGnFs5J1
         ybN+ksPTyb3wYOTaqrNCCBQvG74Yeiso5JDgyHUvmpJjb7JtcRaPUcvFUEy5rMdS+xd3
         B7C3XqpJvchOdUUp0GdUb37W3SkDF5Cd88CaN9d4IQ5q1w1ylM7eE5ufoe9taH+V8ubq
         3GBVrqp+1iHAGvLNvQGdYpqT19y5RyYyu8VOX/GyhCkjn+qFuXd0I/b+zYYpfFnQ8lLB
         H5qw==
X-Gm-Message-State: AAQBX9fr3WGNHY1Pah2s9zy6ist5yO+ApRLocbnvyTeTU89X7rDZ1RK+
        NEEZ/ZxIVvWzf1V7TEtZhqSg2Y/zdjYkbW4fuRSnia8AyPhRdp7C+Z6J3rUs7YREAB7xUvi1ZX5
        A+T39I2ng8wfNI+1H5Rpq
X-Received: by 2002:a17:906:1dd4:b0:92a:8067:7637 with SMTP id v20-20020a1709061dd400b0092a80677637mr476857ejh.61.1680571708918;
        Mon, 03 Apr 2023 18:28:28 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZpQfzYsSTyZHq2rBGoLqdwt6NU1J/h3ko86D9IEobUotm8XZXJaMVYF9BCnMtF6nYkOmpx4A==
X-Received: by 2002:a17:906:1dd4:b0:92a:8067:7637 with SMTP id v20-20020a1709061dd400b0092a80677637mr476837ejh.61.1680571708714;
        Mon, 03 Apr 2023 18:28:28 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id ty25-20020a170907c71900b00948ca65d61fsm1287053ejc.140.2023.04.03.18.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 18:28:28 -0700 (PDT)
From:   Danilo Krummrich <dakr@redhat.com>
To:     airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
        mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
        bskeggs@redhat.com, Liam.Howlett@oracle.com,
        matthew.brost@intel.com, boris.brezillon@collabora.com,
        alexdeucher@gmail.com, ogabbay@kernel.org, bagasdotme@gmail.com,
        willy@infradead.org, jason@jlekstrand.net
Cc:     dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH drm-next v3 11/15] drm/nouveau: fence: fail to emit when fence context is killed
Date:   Tue,  4 Apr 2023 03:27:37 +0200
Message-Id: <20230404012741.116502-12-dakr@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404012741.116502-1-dakr@redhat.com>
References: <20230404012741.116502-1-dakr@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The new VM_BIND UAPI implementation introduced in subsequent commits
will allow asynchronous jobs processing push buffers and emitting
fences.

If a fence context is killed, e.g. due to a channel fault, jobs which
are already queued for execution might still emit new fences. In such a
case a job would hang forever.

To fix that, fail to emit a new fence on a killed fence context with
-ENODEV to unblock the job.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 7 +++++++
 drivers/gpu/drm/nouveau/nouveau_fence.h | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index e946408f945b..77c739a55b19 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -96,6 +96,7 @@ nouveau_fence_context_kill(struct nouveau_fence_chan *fctx, int error)
 		if (nouveau_fence_signal(fence))
 			nvif_event_block(&fctx->event);
 	}
+	fctx->killed = 1;
 	spin_unlock_irqrestore(&fctx->lock, flags);
 }
 
@@ -229,6 +230,12 @@ nouveau_fence_emit(struct nouveau_fence *fence, struct nouveau_channel *chan)
 		dma_fence_get(&fence->base);
 		spin_lock_irq(&fctx->lock);
 
+		if (unlikely(fctx->killed)) {
+			spin_unlock_irq(&fctx->lock);
+			dma_fence_put(&fence->base);
+			return -ENODEV;
+		}
+
 		if (nouveau_fence_update(chan, fctx))
 			nvif_event_block(&fctx->event);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouveau/nouveau_fence.h
index 7c73c7c9834a..2c72d96ef17d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
@@ -44,7 +44,7 @@ struct nouveau_fence_chan {
 	char name[32];
 
 	struct nvif_event event;
-	int notify_ref, dead;
+	int notify_ref, dead, killed;
 };
 
 struct nouveau_fence_priv {
-- 
2.39.2

