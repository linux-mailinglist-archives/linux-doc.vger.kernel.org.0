Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B6F675A34D
	for <lists+linux-doc@lfdr.de>; Thu, 20 Jul 2023 02:17:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbjGTAQ7 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 19 Jul 2023 20:16:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbjGTAQo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Jul 2023 20:16:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA9542118
        for <linux-doc@vger.kernel.org>; Wed, 19 Jul 2023 17:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689812133;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/pp7pCNssCFdX07s9SqyoLBjaIvnkOQtt7NO/vv36Sc=;
        b=PdkbG8SsPK2xlCD0elGelpFfY8uLNkUCIDmyovjFVpGnovykHgV6kbJKVezxupXI/NS/cx
        SrLU/b/1OYo+rDe4Uv0gVxZN14/JkHTpDmO9SkzTlp+rmvJntt8cIlwN42r+MHH7U7ogDe
        aAXBUobCxD0UTl4Gwt0BsR7LQGE/m9g=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-U8AlnH8-NpuGQ2PIEyufeA-1; Wed, 19 Jul 2023 20:15:32 -0400
X-MC-Unique: U8AlnH8-NpuGQ2PIEyufeA-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-51e02395cf3so87457a12.1
        for <linux-doc@vger.kernel.org>; Wed, 19 Jul 2023 17:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689812130; x=1692404130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/pp7pCNssCFdX07s9SqyoLBjaIvnkOQtt7NO/vv36Sc=;
        b=LudqHu4iBOY1+/b+IVutX0IOA+zWxKS8PQTXdVj5OilCGipjLDf5MUpsRvpBoge+2o
         U+gTzjSmtsa/zxyYHHJvVYveifkdhj+IuaBjgsDFZ0UaVtjMClnqfxO8JJpfEJS0qERb
         iVP/7BebnlpJxZ9/NyGxcanb9SFlmCPfkbxgEWaXKG7emDrS2tXJ0mJp/Vs8DE+ixfb7
         enIryIr+TUHQeTZipY90StdqBZCaG45qhIu03GlZtZXsfS/4rxNkQ0TeDXgA2nw5fDKi
         IKO0W2EQHaloZzUg1t/l2TOHRgpyWUJmGJb5zI2tt0TvSefqQ+avIV8jpQQ2vrklTXDv
         6BGA==
X-Gm-Message-State: ABy/qLYKnU1TuM0zagTQ2R5ubwmdIoMrE1X48ZpRWQJ77H69XNIRmrEq
        t1Q4u+JFmAi2gkgKOu+WJIOAXfy65O5f+BYvxUz0jt9L5liqNSryuU+GokO/xhVKVlbXPb5A/K7
        5AU9u+ZlVvN7PPhiNolC2
X-Received: by 2002:aa7:df82:0:b0:51e:5686:d0f8 with SMTP id b2-20020aa7df82000000b0051e5686d0f8mr3267117edy.10.1689812130840;
        Wed, 19 Jul 2023 17:15:30 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEY0jNJR563RWawHMsZiYL8i7vVzYGf6EAZKyG8JAuq4b4CkUSHn2cXQQXFqqniM+7z3huhmQ==
X-Received: by 2002:aa7:df82:0:b0:51e:5686:d0f8 with SMTP id b2-20020aa7df82000000b0051e5686d0f8mr3267108edy.10.1689812130666;
        Wed, 19 Jul 2023 17:15:30 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id f24-20020a056402005800b0051dd4daf13fsm3401489edu.30.2023.07.19.17.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 17:15:30 -0700 (PDT)
From:   Danilo Krummrich <dakr@redhat.com>
To:     airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
        mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
        bskeggs@redhat.com, Liam.Howlett@oracle.com,
        matthew.brost@intel.com, boris.brezillon@collabora.com,
        alexdeucher@gmail.com, ogabbay@kernel.org, bagasdotme@gmail.com,
        willy@infradead.org, jason@jlekstrand.net, donald.robson@imgtec.com
Cc:     dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH drm-misc-next v8 08/12] drm/nouveau: fence: fail to emit when fence context is killed
Date:   Thu, 20 Jul 2023 02:14:29 +0200
Message-ID: <20230720001443.2380-9-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230720001443.2380-1-dakr@redhat.com>
References: <20230720001443.2380-1-dakr@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
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
2.41.0

