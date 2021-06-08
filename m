Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7510A3A05D5
	for <lists+linux-doc@lfdr.de>; Tue,  8 Jun 2021 23:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234404AbhFHV0W (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 8 Jun 2021 17:26:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56254 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234389AbhFHV0N (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Jun 2021 17:26:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623187458;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ViEykWcWGSvJdleNjNz3B2WrAcaruIrzouc3Tvdb1Z4=;
        b=h2jErdL0UFLT18AJxNykrpINr9It6vx7ZKgFHInOaz9lADFkllpOPDcRPFDluzrCjrwG65
        BXCsrrhWP2KWD3vIPSUFDVtjRPIawYxomUbx4cZ7Uw+aGRYfqs/KKX+9ZycRgGFFwc/uai
        C+j1Jls28j+WJU4C/k778aieFo61ghM=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-LGBtAD6iNVeUt6hcwBVaRQ-1; Tue, 08 Jun 2021 17:24:17 -0400
X-MC-Unique: LGBtAD6iNVeUt6hcwBVaRQ-1
Received: by mail-oi1-f197.google.com with SMTP id w12-20020aca490c0000b02901f1fdc1435aso6408413oia.14
        for <linux-doc@vger.kernel.org>; Tue, 08 Jun 2021 14:24:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ViEykWcWGSvJdleNjNz3B2WrAcaruIrzouc3Tvdb1Z4=;
        b=WPZznbM96BpFdebNbiSsSCe6dJxRs+4VCHahbvItKCfxprecEmAgq3oQUaKH5Xez57
         AUl1uhfDmR3K1p01NEUZYicFYDqpCRpMNaML1vG+TPM7ffBC/jNcyhuDqysk1f0cIBqy
         pV+TzRO2/cEmf9oSNa+ishPhJ30xDUkP54jEGFkGTF3T6UooTEj5BxXBzDvuyJH3giRR
         Oi5IgCe/BaPbopHI2KdojhwdaF/vLpH1JDXx8XIYhzP++eFpKkZveymOjRnFuNv6TIxi
         W4wI2MU3ncmG5L9G0NhoufRCQlPdCG+sGLzF7/7tnMmI5JIcRNhNqDFjE3isGZR41mW9
         CnYg==
X-Gm-Message-State: AOAM5316teUAboNzjGrsEDFaSXo1nPMAwgqXgePX7H5VfI5waKGKDoC+
        D+1yX/7J3q58BB3H+oC16aQwG8amRYUu+1Y4z98T7pg5XqGVsFjaL2sXLXmvuxFLxScCWZpEc+R
        d2dQEieWPEEFhgVn3+WdP
X-Received: by 2002:a05:6830:18c2:: with SMTP id v2mr9157813ote.153.1623187456524;
        Tue, 08 Jun 2021 14:24:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6QzilQkRl7SxrG+FgBy24w4LGvOChfmKmMWjk5ocJ4F1tbHl+3eLZ+0Zx8MJFGgZAvEZWoA==
X-Received: by 2002:a05:6830:18c2:: with SMTP id v2mr9157792ote.153.1623187456326;
        Tue, 08 Jun 2021 14:24:16 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id x199sm1954310oif.5.2021.06.08.14.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 14:24:16 -0700 (PDT)
From:   trix@redhat.com
To:     mdf@kernel.org, robh+dt@kernel.org, hao.wu@intel.com,
        corbet@lwn.net, fbarrat@linux.ibm.com, ajd@linux.ibm.com,
        bbrezillon@kernel.org, arno@natisbad.org, schalla@marvell.com,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        gregkh@linuxfoundation.org, Sven.Auhagen@voleatech.de,
        grandmaster@al2klimov.de
Cc:     linux-fpga@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
        linux-staging@lists.linux.dev, Tom Rix <trix@redhat.com>
Subject: [PATCH 06/11] fpga: bridge: change FPGA indirect article to an
Date:   Tue,  8 Jun 2021 14:23:45 -0700
Message-Id: <20210608212350.3029742-8-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210608212350.3029742-1-trix@redhat.com>
References: <20210608212350.3029742-1-trix@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Tom Rix <trix@redhat.com>

Change use of 'a fpga' to 'an fpga'

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/fpga/fpga-bridge.c       | 22 +++++++++++-----------
 include/linux/fpga/fpga-bridge.h |  2 +-
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/fpga/fpga-bridge.c b/drivers/fpga/fpga-bridge.c
index 05c6d4f2d043f..beef53b194b27 100644
--- a/drivers/fpga/fpga-bridge.c
+++ b/drivers/fpga/fpga-bridge.c
@@ -85,14 +85,14 @@ static struct fpga_bridge *__fpga_bridge_get(struct device *dev,
 }
 
 /**
- * of_fpga_bridge_get - get an exclusive reference to a fpga bridge
+ * of_fpga_bridge_get - get an exclusive reference to an fpga bridge
  *
- * @np: node pointer of a FPGA bridge
+ * @np: node pointer of an FPGA bridge
  * @info: fpga image specific information
  *
  * Return fpga_bridge struct if successful.
  * Return -EBUSY if someone already has a reference to the bridge.
- * Return -ENODEV if @np is not a FPGA Bridge.
+ * Return -ENODEV if @np is not an FPGA Bridge.
  */
 struct fpga_bridge *of_fpga_bridge_get(struct device_node *np,
 				       struct fpga_image_info *info)
@@ -113,11 +113,11 @@ static int fpga_bridge_dev_match(struct device *dev, const void *data)
 }
 
 /**
- * fpga_bridge_get - get an exclusive reference to a fpga bridge
+ * fpga_bridge_get - get an exclusive reference to an fpga bridge
  * @dev:	parent device that fpga bridge was registered with
  * @info:	fpga manager info
  *
- * Given a device, get an exclusive reference to a fpga bridge.
+ * Given a device, get an exclusive reference to an fpga bridge.
  *
  * Return: fpga bridge struct or IS_ERR() condition containing error code.
  */
@@ -224,7 +224,7 @@ EXPORT_SYMBOL_GPL(fpga_bridges_put);
 /**
  * of_fpga_bridge_get_to_list - get a bridge, add it to a list
  *
- * @np: node pointer of a FPGA bridge
+ * @np: node pointer of an FPGA bridge
  * @info: fpga image specific information
  * @bridge_list: list of FPGA bridges
  *
@@ -373,7 +373,7 @@ struct fpga_bridge *fpga_bridge_create(struct device *dev, const char *name,
 EXPORT_SYMBOL_GPL(fpga_bridge_create);
 
 /**
- * fpga_bridge_free - free a fpga bridge created by fpga_bridge_create()
+ * fpga_bridge_free - free an fpga bridge created by fpga_bridge_create()
  * @bridge:	FPGA bridge struct
  */
 void fpga_bridge_free(struct fpga_bridge *bridge)
@@ -397,7 +397,7 @@ static void devm_fpga_bridge_release(struct device *dev, void *res)
  * @br_ops:	pointer to structure of fpga bridge ops
  * @priv:	FPGA bridge private data
  *
- * This function is intended for use in a FPGA bridge driver's probe function.
+ * This function is intended for use in an FPGA bridge driver's probe function.
  * After the bridge driver creates the struct with devm_fpga_bridge_create(), it
  * should register the bridge with fpga_bridge_register().  The bridge driver's
  * remove function should call fpga_bridge_unregister().  The bridge struct
@@ -430,7 +430,7 @@ struct fpga_bridge
 EXPORT_SYMBOL_GPL(devm_fpga_bridge_create);
 
 /**
- * fpga_bridge_register - register a FPGA bridge
+ * fpga_bridge_register - register an FPGA bridge
  *
  * @bridge: FPGA bridge struct
  *
@@ -454,11 +454,11 @@ int fpga_bridge_register(struct fpga_bridge *bridge)
 EXPORT_SYMBOL_GPL(fpga_bridge_register);
 
 /**
- * fpga_bridge_unregister - unregister a FPGA bridge
+ * fpga_bridge_unregister - unregister an FPGA bridge
  *
  * @bridge: FPGA bridge struct
  *
- * This function is intended for use in a FPGA bridge driver's remove function.
+ * This function is intended for use in an FPGA bridge driver's remove function.
  */
 void fpga_bridge_unregister(struct fpga_bridge *bridge)
 {
diff --git a/include/linux/fpga/fpga-bridge.h b/include/linux/fpga/fpga-bridge.h
index 817600a32c935..6c3c28806ff13 100644
--- a/include/linux/fpga/fpga-bridge.h
+++ b/include/linux/fpga/fpga-bridge.h
@@ -11,7 +11,7 @@ struct fpga_bridge;
 /**
  * struct fpga_bridge_ops - ops for low level FPGA bridge drivers
  * @enable_show: returns the FPGA bridge's status
- * @enable_set: set a FPGA bridge as enabled or disabled
+ * @enable_set: set an FPGA bridge as enabled or disabled
  * @fpga_bridge_remove: set FPGA into a specific state during driver remove
  * @groups: optional attribute groups.
  */
-- 
2.26.3

