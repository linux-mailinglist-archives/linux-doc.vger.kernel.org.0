Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1FD96D5605
	for <lists+linux-doc@lfdr.de>; Tue,  4 Apr 2023 03:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232545AbjDDB3U (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 3 Apr 2023 21:29:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232605AbjDDB3T (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Apr 2023 21:29:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D8D410D5
        for <linux-doc@vger.kernel.org>; Mon,  3 Apr 2023 18:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680571680;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zKXKlpbqPz1zBDAc8gRMr7UD/43fGbZFIFAeWQ+/v+c=;
        b=YENrR3fzcquy8NVqzzhRwAbX3XfKwDAN+7FMzwvAYq8s33manYEh6/r2QrcO804wB/Oqkx
        M8MrCekUw54SbI8Yh+7P8Y9RHwXZEh5ACVyzOWzR/kfFjX86jyR3P5+Eij5ZnhI2XbZU3a
        fJLIdVP0/81GP8tQCb1LRv39Sp4PxbM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-0awrniP5Nv-SFOktLM6CVQ-1; Mon, 03 Apr 2023 21:27:59 -0400
X-MC-Unique: 0awrniP5Nv-SFOktLM6CVQ-1
Received: by mail-ed1-f70.google.com with SMTP id i22-20020a05640242d600b004f5962985f4so44235888edc.12
        for <linux-doc@vger.kernel.org>; Mon, 03 Apr 2023 18:27:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680571678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zKXKlpbqPz1zBDAc8gRMr7UD/43fGbZFIFAeWQ+/v+c=;
        b=mKQ2x+jT03jXVOqbC0kGysl4XTKdtJ7X5f5YfZ2guOE5rruB+CmXsypWAJ3U4UKg3P
         dvv9eNBZW3ebWb04y8RFW0I3kY2rbQFftk+tv+puCU8jfPQb/z0yHaeLlCKsl9PZpy54
         kModBA8oNGn8csuoB8ZM3VBlTAIVcSaR4juO0J4V/Bz5VKLpWC6VulvTz5d5i03UXIdk
         Pg2SKBEYIS1rv2+sgdqvub05nAIxOGFo4CHH+jtH/DmctXCpguF8X01sgDFi6NtiUXkc
         3NPCEUrxw+mLuW7+kapg4nj05oLAvt4ahkx1bBe3PI4vf31Ubb0xaq4MlGHKxauEiJ2K
         YNbw==
X-Gm-Message-State: AAQBX9eVugxgRzm1kWWhx26eidZfUBFPHjqzlzzyd9oxZOanNTRzcgrD
        9Ta8Q262bYOyEO+rxirR0bBstYkbt7o5Eo9LuTuKzysPUgZ/bBtCOea+QTrkj22fa75rNI+iuQZ
        wqnWUIzkitHUbzSB5pgx8
X-Received: by 2002:a17:906:3518:b0:947:f937:d58c with SMTP id r24-20020a170906351800b00947f937d58cmr399010eja.73.1680571678178;
        Mon, 03 Apr 2023 18:27:58 -0700 (PDT)
X-Google-Smtp-Source: AKy350YwVNPsPlkQRJTUmcCSFAR4UCs9dVRBPURJGBPqRf9UDK5ZqVStZ/XxLd5hu3kZ37jVcjG1Sg==
X-Received: by 2002:a17:906:3518:b0:947:f937:d58c with SMTP id r24-20020a170906351800b00947f937d58cmr398989eja.73.1680571677891;
        Mon, 03 Apr 2023 18:27:57 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id z9-20020a17090665c900b0093fa8c2e877sm5158255ejn.80.2023.04.03.18.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 18:27:57 -0700 (PDT)
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
Subject: [PATCH drm-next v3 03/15] maple_tree: split up MA_STATE() macro
Date:   Tue,  4 Apr 2023 03:27:29 +0200
Message-Id: <20230404012741.116502-4-dakr@redhat.com>
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

Split up the MA_STATE() macro such that components using the maple tree
can easily inherit from struct ma_state and build custom tree walk
macros to hide their internals from users.

Example:

struct sample_iterator {
	struct ma_state mas;
	struct sample_mgr *mgr;
};

\#define SAMPLE_ITERATOR(name, __mgr, start)			\
	struct sample_iterator name = {				\
		.mas = MA_STATE_INIT(&(__mgr)->mt, start, 0),	\
		.mgr = __mgr,					\
	}

\#define sample_iter_for_each_range(it__, entry__, end__) \
	mas_for_each(&(it__).mas, entry__, end__)

--

struct sample *sample;
SAMPLE_ITERATOR(si, min);

sample_iter_for_each_range(&si, sample, max) {
	frob(mgr, sample);
}

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 include/linux/maple_tree.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/linux/maple_tree.h b/include/linux/maple_tree.h
index 1fadb5f5978b..87d55334f1c2 100644
--- a/include/linux/maple_tree.h
+++ b/include/linux/maple_tree.h
@@ -423,8 +423,8 @@ struct ma_wr_state {
 #define MA_ERROR(err) \
 		((struct maple_enode *)(((unsigned long)err << 2) | 2UL))
 
-#define MA_STATE(name, mt, first, end)					\
-	struct ma_state name = {					\
+#define MA_STATE_INIT(mt, first, end)					\
+	{								\
 		.tree = mt,						\
 		.index = first,						\
 		.last = end,						\
@@ -435,6 +435,9 @@ struct ma_wr_state {
 		.mas_flags = 0,						\
 	}
 
+#define MA_STATE(name, mt, first, end)					\
+	struct ma_state name = MA_STATE_INIT(mt, first, end)
+
 #define MA_WR_STATE(name, ma_state, wr_entry)				\
 	struct ma_wr_state name = {					\
 		.mas = ma_state,					\
-- 
2.39.2

