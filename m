Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C2464C943B
	for <lists+linux-doc@lfdr.de>; Tue,  1 Mar 2022 20:29:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235235AbiCATaE (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 1 Mar 2022 14:30:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235074AbiCATaD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Mar 2022 14:30:03 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 08F3543EE4
        for <linux-doc@vger.kernel.org>; Tue,  1 Mar 2022 11:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646162961;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=b+msLQunHEcmiuuu7B6KPaPcoKHsejBtZdFml9n1AXs=;
        b=OVKvkIRDPw3LHKGovHjAzOnRksEoKBhk4PIFnl0m1Th2tbnZ7UcSt50/MyKuThZWjeixBC
        GVBHKgJFGTNejWh0kR5BS3kAEZpyf0p21TAWuN3h5clJt+toeDEzOf+32LNv2wYlpoYTjr
        vX3SvzdHTk0cOtw6+uCIVMuF1MKSRx4=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-DolpFyzfPkuSaZl9cDUNhw-1; Tue, 01 Mar 2022 14:29:20 -0500
X-MC-Unique: DolpFyzfPkuSaZl9cDUNhw-1
Received: by mail-ot1-f70.google.com with SMTP id 38-20020a9d0829000000b005afe328b01dso7616839oty.16
        for <linux-doc@vger.kernel.org>; Tue, 01 Mar 2022 11:29:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b+msLQunHEcmiuuu7B6KPaPcoKHsejBtZdFml9n1AXs=;
        b=uV1PPKMnOacPAwCu3q2Lj2yc2brprkoCysxnwcssJ8UIER3/wrqVyBfhBe1jN9e+A/
         TbNM/zrYdKFCkMLCDi1l6SL2CdfL5a6mHKfec1KSiznOMzEtrM8Im6aHaVEwMAsE5WBA
         h5MCzwdt3nqkSsHC/xThY6STv6wPFuU777eFhaU1N8kZD3CZIs/s+bI7ftFUxpI03NsC
         oSTS0Dl7itR+bPPEPEgsnc/GJ/hfU+2ehRLjiLd7j4XdCplG8tgpj7OOxfTsbS5vrSZH
         sucH14uOWz8iMPoW1+KPsRibVQfzpgBxIQ23C0FgSZSfxHMRwWgPHKMspIPXonmFsl+v
         IfiQ==
X-Gm-Message-State: AOAM5314yBesyXB0i/FNdSwG1k95VEA8fsadcyrf/y9xFTyx7lji9ZlT
        v6BYK6M3lZ+IJR1yfQTiaTkMcftGDRcLuzGCfXiwGXeZY1U/xkmtIzxEC8y4PmcTDCEa8amnE+M
        7RID7AvvgqSU+v5EyBnaL
X-Received: by 2002:a05:6870:87c4:b0:bc:4b13:b0c0 with SMTP id s4-20020a05687087c400b000bc4b13b0c0mr5039319oam.136.1646162959408;
        Tue, 01 Mar 2022 11:29:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpLY9TTBQgKSPEKTWZlSp5xirp8uo7AKtiTGqXvhErF6hETfzSvsXuEhplLz2OX8xyyVD/vQ==
X-Received: by 2002:a05:6870:87c4:b0:bc:4b13:b0c0 with SMTP id s4-20020a05687087c400b000bc4b13b0c0mr5039301oam.136.1646162959171;
        Tue, 01 Mar 2022 11:29:19 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id t7-20020a9d5907000000b005afa4058a4csm7019270oth.1.2022.03.01.11.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 11:29:18 -0800 (PST)
From:   trix@redhat.com
To:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
        corbet@lwn.net, bhelgaas@google.com
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: [PATCH] vgaarbiter: fix vgaarbiter doc build break
Date:   Tue,  1 Mar 2022 11:29:09 -0800
Message-Id: <20220301192909.294900-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Tom Rix <trix@redhat.com>

make htmldocs fails with
Error: Cannot open file ./drivers/gpu/vga/vgaarb.c

The location of the file changed
drivers/gpu/vga/vgaarb.c -> drivers/pci/vgaarb.c
So update the docs with the new location.

Fixes: d6e1898bfa5b ("PCI/VGA: Move vgaarb to drivers/pci")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 Documentation/gpu/vgaarbiter.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/vgaarbiter.rst b/Documentation/gpu/vgaarbiter.rst
index 339ed5fecd2e4..bde3c0afb0590 100644
--- a/Documentation/gpu/vgaarbiter.rst
+++ b/Documentation/gpu/vgaarbiter.rst
@@ -100,7 +100,7 @@ In-kernel interface
 .. kernel-doc:: include/linux/vgaarb.h
    :internal:
 
-.. kernel-doc:: drivers/gpu/vga/vgaarb.c
+.. kernel-doc:: drivers/pci/vgaarb.c
    :export:
 
 libpciaccess
-- 
2.26.3

