Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44C106D561C
	for <lists+linux-doc@lfdr.de>; Tue,  4 Apr 2023 03:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232910AbjDDBaQ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 3 Apr 2023 21:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232789AbjDDB3o (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Apr 2023 21:29:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8F45422E
        for <linux-doc@vger.kernel.org>; Mon,  3 Apr 2023 18:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680571726;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=o823AL8VZ1LMNlMTP6aYg3xJJTWgQdWRn/9lqJMAMBk=;
        b=PQPpiVyYP6E92Z91TSr0GITM3E3MEghDF/ZkXN7HzAnrCzzGYH349USVcmwSe/NoE8AuoY
        Xw4JRXklDa1uZ1sjlhm9ZSsSyP3tNQkLmGVzamwM+wXx5RLN3OCCqpWO8nb+2fgpyZw4UX
        huDS915gXmRwL9PFjrrhHJsJuobcmIU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-j1qgQ6tiO3On1nvLIPmudg-1; Mon, 03 Apr 2023 21:28:45 -0400
X-MC-Unique: j1qgQ6tiO3On1nvLIPmudg-1
Received: by mail-ed1-f70.google.com with SMTP id v1-20020a50d581000000b0050291cda08aso10030699edi.15
        for <linux-doc@vger.kernel.org>; Mon, 03 Apr 2023 18:28:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680571724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o823AL8VZ1LMNlMTP6aYg3xJJTWgQdWRn/9lqJMAMBk=;
        b=L6L0G5FASC+tRu3UbGlmFiKaC1kOWvPfKx6c/12CkCMfqvogi5ydO4V6R9X9MspMvD
         7NIxIQUxV3PLm4FY606LpqGYxDbEnJjkl2qmzxH1YS1O+QW1LHpYTX7Fjr4cmL0SeIeP
         UqmXeAjdhpDahMi9JSFKxRROLELguLDEdbAc10+uu9JRLZLXqpownPsEjl7S3VLBUAHo
         EOlp4D0BMqSJQnuHoduHDf/QLJ+qBHJiIjl91vQzrhVf0kdT/OsOWwY7ggnQ2230LShf
         HEIPFKo7Rwaow6QQK2y++T/D8fdofil0F9FyQ/yW4GZSrDCwieFjvyDq94k7FaZTMype
         /uNw==
X-Gm-Message-State: AAQBX9fbKv7oSCsv9dVroP1uSxAP2R6yeFJmCtV1bmW05Y8v9IA1WtfT
        LHbHwPqcD9drqxWKerxYzvhLIPNXvb0+1TpUbnLVNoNn+xCxdgNSDgn12Ha/4S+6HPtt8yWqrXT
        8HrEjKHbloTNa0qxHSxcr
X-Received: by 2002:a17:906:9c96:b0:92f:b290:78c with SMTP id fj22-20020a1709069c9600b0092fb290078cmr618024ejc.21.1680571724454;
        Mon, 03 Apr 2023 18:28:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350YBQbJEEi72BHSZD+4oPg/dW8cv06s9DIHCLme50cSEKLFt5Tzd9CFlGMdi5gzZOM0kcpe/wQ==
X-Received: by 2002:a17:906:9c96:b0:92f:b290:78c with SMTP id fj22-20020a1709069c9600b0092fb290078cmr618007ejc.21.1680571724265;
        Mon, 03 Apr 2023 18:28:44 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id gl25-20020a170906e0d900b00929fc8d264dsm5310643ejb.17.2023.04.03.18.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 18:28:43 -0700 (PDT)
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
Subject: [PATCH drm-next v3 15/15] drm/nouveau: debugfs: implement DRM GPU VA debugfs
Date:   Tue,  4 Apr 2023 03:27:41 +0200
Message-Id: <20230404012741.116502-16-dakr@redhat.com>
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

Provide the driver indirection iterating over all DRM GPU VA spaces to
enable the common 'gpuvas' debugfs file for dumping DRM GPU VA spaces.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_debugfs.c | 39 +++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index 2a36d1ca8fda..d5487e655b0c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -202,6 +202,44 @@ nouveau_debugfs_pstate_open(struct inode *inode, struct file *file)
 	return single_open(file, nouveau_debugfs_pstate_get, inode->i_private);
 }
 
+static void
+nouveau_debugfs_gpuva_regions(struct seq_file *m, struct nouveau_uvmm *uvmm)
+{
+	MA_STATE(mas, &uvmm->region_mt, 0, 0);
+	struct nouveau_uvma_region *reg;
+
+	seq_puts  (m, " VA regions  | start              | range              | end                \n");
+	seq_puts  (m, "----------------------------------------------------------------------------\n");
+	mas_for_each(&mas, reg, ULONG_MAX)
+		seq_printf(m, "             | 0x%016llx | 0x%016llx | 0x%016llx\n",
+			   reg->va.addr, reg->va.range, reg->va.addr + reg->va.range);
+}
+
+static int
+nouveau_debugfs_gpuva(struct seq_file *m, void *data)
+{
+	struct drm_info_node *node = (struct drm_info_node *) m->private;
+	struct nouveau_drm *drm = nouveau_drm(node->minor->dev);
+	struct nouveau_cli *cli;
+
+	mutex_lock(&drm->clients_lock);
+	list_for_each_entry(cli, &drm->clients, head) {
+		struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(cli);
+
+		if (!uvmm)
+			continue;
+
+		nouveau_uvmm_lock(uvmm);
+		drm_debugfs_gpuva_info(m, &uvmm->umgr);
+		seq_puts(m, "\n");
+		nouveau_debugfs_gpuva_regions(m, uvmm);
+		nouveau_uvmm_unlock(uvmm);
+	}
+	mutex_unlock(&drm->clients_lock);
+
+	return 0;
+}
+
 static const struct file_operations nouveau_pstate_fops = {
 	.owner = THIS_MODULE,
 	.open = nouveau_debugfs_pstate_open,
@@ -213,6 +251,7 @@ static const struct file_operations nouveau_pstate_fops = {
 static struct drm_info_list nouveau_debugfs_list[] = {
 	{ "vbios.rom",  nouveau_debugfs_vbios_image, 0, NULL },
 	{ "strap_peek", nouveau_debugfs_strap_peek, 0, NULL },
+	DRM_DEBUGFS_GPUVA_INFO(nouveau_debugfs_gpuva, NULL),
 };
 #define NOUVEAU_DEBUGFS_ENTRIES ARRAY_SIZE(nouveau_debugfs_list)
 
-- 
2.39.2

