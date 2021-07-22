Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26A5D3D21AF
	for <lists+linux-doc@lfdr.de>; Thu, 22 Jul 2021 12:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231400AbhGVJYP (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 22 Jul 2021 05:24:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231487AbhGVJXz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Jul 2021 05:23:55 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB725C0617BF
        for <linux-doc@vger.kernel.org>; Thu, 22 Jul 2021 03:04:01 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id qa36so7518651ejc.10
        for <linux-doc@vger.kernel.org>; Thu, 22 Jul 2021 03:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O5k1ohszAVNVySw+b/NysMDBmiWRTy89ftF3oPBgk2U=;
        b=Xwv9dYcT/4MkmO4w1YIz3HGEpxGql1UxWsJch8NZSIu5r0H8vrieBqlWmAo/xbysoL
         EaM24han/FgxCgVWvFKOVCfVlMESntnyF2VUwkn1TZTRqZ6O4Ik4BBTUd+iizMzCpL+N
         KEQ7y1Poj9xwMdEYAQDuuwAoubcMQPMbtKJxevtv6lt3yeCEJUhL5zwbouZBVIWbG33S
         KQBsQKY2kkN91N62ho4cTZmWI3VxJ1+LTma/TdhMw0bkiuNd4uerqaAjoQtv1ALLiErn
         Myvn/dus7HuSOcG1KZpb2Q3FbPfegnyBKa3vQLTqVI3V1pIT/OtSUr09ZfFzWmaB1SUk
         JOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O5k1ohszAVNVySw+b/NysMDBmiWRTy89ftF3oPBgk2U=;
        b=EWSqdmVcMSZHb6x3cq78f9beSNRzOfxs4aDoYTdmfuDxDnWVnN5Ntz6CzN9bvhHwRW
         s+UjI1bm3BNE2NEXuoLAH3ECw5tz8KyAnl4u0clpHjHk/MXEUk45HGMj2WzFXr0k64qc
         pBTezD0Hmu3pcaLpRLj4TkHFX9+GHzvHf1WgiJ9asEMAUa1BM3mBCNHyreDKljkX3IYV
         /9z92Kg119p9bIgo90xb6j/KJctBQCBixfld34wygoouOfRaI9XwNJdYDZ4r3GxTTHTL
         GceXBNisQdXLLu2NM0wJwPlMxpSSPjGk8GtxUZ6qEtxgSGcGQpCidCtvoPdntSvTRctp
         z2Pw==
X-Gm-Message-State: AOAM530+sJMfSEQydVIaorjjdpI6cEr/CE8US/7gDkivPMoN3HhF70Ad
        w9fMmgPClR4ObR3F11dQE/c=
X-Google-Smtp-Source: ABdhPJwye2QDMC+uUQV+3UC4WlAQdyiAw0h1CajgC48a7W8/3g0q06vgwDm2UqAelxxIjJWgqXvGRQ==
X-Received: by 2002:a17:906:2acc:: with SMTP id m12mr43680474eje.231.1626948239846;
        Thu, 22 Jul 2021 03:03:59 -0700 (PDT)
Received: from yoga-910.localhost ([82.76.66.29])
        by smtp.gmail.com with ESMTPSA id cb4sm9341749ejb.72.2021.07.22.03.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 03:03:59 -0700 (PDT)
From:   Ioana Ciornei <ciorneiioana@gmail.com>
To:     Jonathan Corbet <corbet@lwn.net>, Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     linux-doc@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Maxim Levitsky <mlevitsk@redhat.com>,
        Jing Zhang <jingzhangos@google.com>,
        Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: [PATCH 4/4] docs: networking: dpaa2: fix chapter title format
Date:   Thu, 22 Jul 2021 13:03:56 +0300
Message-Id: <20210722100356.635078-5-ciorneiioana@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210722100356.635078-1-ciorneiioana@gmail.com>
References: <20210722100356.635078-1-ciorneiioana@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Ioana Ciornei <ioana.ciornei@nxp.com>

Fix the DPAA2 DPIO driver chapter title by adding the necessary
overline. Without this, the index page of the DPAA2 documentation
doesn't display properly.

Fixes: d8e516bac73f ("soc: fsl: dpio: Convert DPIO documentation to .rst")
Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 .../device_drivers/ethernet/freescale/dpaa2/dpio-driver.rst      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/networking/device_drivers/ethernet/freescale/dpaa2/dpio-driver.rst b/Documentation/networking/device_drivers/ethernet/freescale/dpaa2/dpio-driver.rst
index c50fd46631e0..e4ebfe62a183 100644
--- a/Documentation/networking/device_drivers/ethernet/freescale/dpaa2/dpio-driver.rst
+++ b/Documentation/networking/device_drivers/ethernet/freescale/dpaa2/dpio-driver.rst
@@ -1,5 +1,6 @@
 .. include:: <isonum.txt>
 
+===================================
 DPAA2 DPIO (Data Path I/O) Overview
 ===================================
 
-- 
2.31.1

