Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 663323A05B6
	for <lists+linux-doc@lfdr.de>; Tue,  8 Jun 2021 23:24:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234230AbhFHV0B (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 8 Jun 2021 17:26:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46065 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234174AbhFHV0A (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Jun 2021 17:26:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623187446;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nkGKzO+CiTBdUeThyikbeVsS+KLpb2VNkP5sOtTgFKc=;
        b=JyAijxeaeVd4wNefC8e7MRaPJdQi4QrnIqNv0TEiqtC8qUETix0ZvVHhz+uvg31ylUqhZQ
        uQYZSEGl4/ElCAeLvW863TCQ3r8rZ1lxGsBT1xqpQWWFUvLLQ5iRTYUgERLiUPIQUh9+0m
        oxb0h89hMfkqhdw7fWOUKvj8UdXXj8A=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516--r9AOArgNm6wIPqW70tTwQ-1; Tue, 08 Jun 2021 17:24:05 -0400
X-MC-Unique: -r9AOArgNm6wIPqW70tTwQ-1
Received: by mail-oo1-f71.google.com with SMTP id r17-20020a4a96510000b029024988968d95so6877204ooi.2
        for <linux-doc@vger.kernel.org>; Tue, 08 Jun 2021 14:24:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nkGKzO+CiTBdUeThyikbeVsS+KLpb2VNkP5sOtTgFKc=;
        b=HPURZu6qB5m1rCfBDqKkuP84q2GKJBNCiAu4EKlAUwqCX7cBFDp7MgcrcKaTRMYfpt
         G9x39I0zyrppWQyhUibAsrg8wX07Klkme4wZRkRxAFm9TknH4E9cCpTACjF1fQoDhPfj
         Mko7G6Fu/6PCz7Trd+M4P0foWCbsjgURqgqSO1ZIzQyl9cfDpaScXUktcp9dOQTbFY9y
         ptD4Q38GXApayzF0w4jhXvQNGQpl2xJa3jQqya4/GhByVycKpVIKuFLNNh8jHA+i27wr
         7IsqMxEoZGRBSFioyHCHStstclWt6wi+oX+lo1KWkdTRQXdWwLxag6NK0w3CACLpNiar
         HKlA==
X-Gm-Message-State: AOAM531ToRJ5gAieMp+/Se3TK49FflusRaa7FSsJbm7JUXcOREsi1KG2
        lcsRf08hzxrT7TfZOevsjP5MmVl8spgK+hC/HXuzpA4+//q/A13tkeUnIZsyGUqTnoPtHlw+dCR
        6Y7KITUCtX5W+Z6GODMSx
X-Received: by 2002:aca:1b11:: with SMTP id b17mr1881556oib.41.1623187444314;
        Tue, 08 Jun 2021 14:24:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypvAWW+ej6XH2gSOp4Ggl1rvJ/MHexAMjH5F0ctMmNCb1jZr3PoAYlElhglwvntrHY5BWilg==
X-Received: by 2002:aca:1b11:: with SMTP id b17mr1881530oib.41.1623187444101;
        Tue, 08 Jun 2021 14:24:04 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id x199sm1954310oif.5.2021.06.08.14.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 14:24:03 -0700 (PDT)
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
Subject: [PATCH 01/11] dt-bindings: fpga: fpga-region: change FPGA indirect article to an
Date:   Tue,  8 Jun 2021 14:23:40 -0700
Message-Id: <20210608212350.3029742-3-trix@redhat.com>
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
 .../devicetree/bindings/fpga/fpga-region.txt  | 22 +++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/fpga/fpga-region.txt b/Documentation/devicetree/bindings/fpga/fpga-region.txt
index d787d57491a1c..7d35152648387 100644
--- a/Documentation/devicetree/bindings/fpga/fpga-region.txt
+++ b/Documentation/devicetree/bindings/fpga/fpga-region.txt
@@ -38,7 +38,7 @@ Partial Reconfiguration (PR)
 
 Partial Reconfiguration Region (PRR)
  * Also called a "reconfigurable partition"
- * A PRR is a specific section of a FPGA reserved for reconfiguration.
+ * A PRR is a specific section of an FPGA reserved for reconfiguration.
  * A base (or static) FPGA image may create a set of PRR's that later may
    be independently reprogrammed many times.
  * The size and specific location of each PRR is fixed.
@@ -105,7 +105,7 @@ reprogrammed independently while the rest of the system continues to function.
 Sequence
 ========
 
-When a DT overlay that targets a FPGA Region is applied, the FPGA Region will
+When a DT overlay that targets an FPGA Region is applied, the FPGA Region will
 do the following:
 
  1. Disable appropriate FPGA bridges.
@@ -134,8 +134,8 @@ The intended use is that a Device Tree overlay (DTO) can be used to reprogram an
 FPGA while an operating system is running.
 
 An FPGA Region that exists in the live Device Tree reflects the current state.
-If the live tree shows a "firmware-name" property or child nodes under a FPGA
-Region, the FPGA already has been programmed.  A DTO that targets a FPGA Region
+If the live tree shows a "firmware-name" property or child nodes under an FPGA
+Region, the FPGA already has been programmed.  A DTO that targets an FPGA Region
 and adds the "firmware-name" property is taken as a request to reprogram the
 FPGA.  After reprogramming is successful, the overlay is accepted into the live
 tree.
@@ -152,9 +152,9 @@ These FPGA regions are children of FPGA bridges which are then children of the
 base FPGA region.  The "Full Reconfiguration to add PRR's" example below shows
 this.
 
-If an FPGA Region does not specify a FPGA Manager, it will inherit the FPGA
+If an FPGA Region does not specify an FPGA Manager, it will inherit the FPGA
 Manager specified by its ancestor FPGA Region.  This supports both the case
-where the same FPGA Manager is used for all of a FPGA as well the case where
+where the same FPGA Manager is used for all of an FPGA as well the case where
 a different FPGA Manager is used for each region.
 
 FPGA Regions do not inherit their ancestor FPGA regions' bridges.  This prevents
@@ -166,7 +166,7 @@ within the static image of the FPGA.
 Required properties:
 - compatible : should contain "fpga-region"
 - fpga-mgr : should contain a phandle to an FPGA Manager.  Child FPGA Regions
-	inherit this property from their ancestor regions.  A fpga-mgr property
+	inherit this property from their ancestor regions.  An fpga-mgr property
 	in a region will override any inherited FPGA manager.
 - #address-cells, #size-cells, ranges : must be present to handle address space
 	mapping for child nodes.
@@ -175,12 +175,12 @@ Optional properties:
 - firmware-name : should contain the name of an FPGA image file located on the
 	firmware search path.  If this property shows up in a live device tree
 	it indicates that the FPGA has already been programmed with this image.
-	If this property is in an overlay targeting a FPGA region, it is a
+	If this property is in an overlay targeting an FPGA region, it is a
 	request to program the FPGA with that image.
 - fpga-bridges : should contain a list of phandles to FPGA Bridges that must be
 	controlled during FPGA programming along with the parent FPGA bridge.
 	This property is optional if the FPGA Manager handles the bridges.
-        If the fpga-region is  the child of a fpga-bridge, the list should not
+        If the fpga-region is  the child of an fpga-bridge, the list should not
         contain the parent bridge.
 - partial-fpga-config : boolean, set if partial reconfiguration is to be done,
 	otherwise full reconfiguration is done.
@@ -279,7 +279,7 @@ Supported Use Models
 
 In all cases the live DT must have the FPGA Manager, FPGA Bridges (if any), and
 a FPGA Region.  The target of the Device Tree Overlay is the FPGA Region.  Some
-uses are specific to a FPGA device.
+uses are specific to an FPGA device.
 
  * No FPGA Bridges
    In this case, the FPGA Manager which programs the FPGA also handles the
@@ -300,7 +300,7 @@ uses are specific to a FPGA device.
    bridges need to exist in the FPGA that can gate the buses going to each FPGA
    region while the buses are enabled for other sections.  Before any partial
    reconfiguration can be done, a base FPGA image must be loaded which includes
-   PRR's with FPGA bridges.  The device tree should have a FPGA region for each
+   PRR's with FPGA bridges.  The device tree should have an FPGA region for each
    PRR.
 
 Device Tree Examples
-- 
2.26.3

