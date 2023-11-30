Return-Path: <linux-doc+bounces-3675-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0803F7FFDEA
	for <lists+linux-doc@lfdr.de>; Thu, 30 Nov 2023 22:50:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B91C1C20E19
	for <lists+linux-doc@lfdr.de>; Thu, 30 Nov 2023 21:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 146995EE8C;
	Thu, 30 Nov 2023 21:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OSkA3sv1"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6F4D10FD;
	Thu, 30 Nov 2023 13:50:12 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-333308c3683so61275f8f.3;
        Thu, 30 Nov 2023 13:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701381011; x=1701985811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QsQQPUJFA0N9J6n5x1AuH73vk59hYe/eciqUbvnbPDs=;
        b=OSkA3sv1n1RM8t7ygyzzkhfC9K3FYS72QoxwxCCkkpzgX32IbDLnEkZy7wNN8f9zDe
         +ImnBIOBzRIG0HgBlzsxPiCwKnXTqaFtqgvlxyHvBIVIN8N6BCXl1N3KbSLK+szkYE94
         QsFbHKijscz5GYgViHzkuHNWxJs04/XfQhbDFhsGGSQrcOA8raHxBlFfPAc/qZelrGQ9
         u9AzTHX8+la9GMi6SN0Kyhsasn4VfAbVEHxmSluVfkwHTR1LbDdl2hkMERpT4XyXcbhP
         LWu0ZrPNxzXegmQYr+13IA9hO72cjrceDiGAogm56ggMmp2OyGVx/gsCxMQeZgyeB/QD
         aeuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701381011; x=1701985811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QsQQPUJFA0N9J6n5x1AuH73vk59hYe/eciqUbvnbPDs=;
        b=n5xoTye70phY4KolHOrCTvz2/XnTkAD6KKt+ZQ2i5EcUhrunaDolb1/JBv0WsWfAGs
         85eDyulAs7ExRg/pg2qqHHQ8aW5G4Su1wZpLup9dA1zqstJ4WwaGSRkvHZCFtjW9laRQ
         SplwlKdmPg8c7O+mZCaa8k7DqJm8aj83FaWP3ORTN79EvevX4IskPCTovy6MOSBYWRo+
         y3I7VGRRJj0d3cZu2yu1KoUk1ZLGCCtrgIOxpG64bQ1Vn6S7TSX/ZXtDMivAXIrA+Gkq
         6lR0c/Yg4sI099lFR4MOBiOW/QALiN7BC3ivPpz2yOsJMrCPuItaJ35PkKHBHualUlup
         QM6A==
X-Gm-Message-State: AOJu0YxBEUXI4SGiSxEm8oH5I3kICs48glQG0IFtXJyc9JKi2IR3GFP9
	7s6NzaI3N9vsHWp+RM+beP7Q7cF/nzAWzQ==
X-Google-Smtp-Source: AGHT+IFgWZbffE4JsNDMZop18V29HDfoGxYSc+q7DhnlR47d6QcNvpskedhrsokVQgsA+1+MNB52/A==
X-Received: by 2002:adf:db50:0:b0:32d:bb4a:525c with SMTP id f16-20020adfdb50000000b0032dbb4a525cmr98896wrj.14.1701381010772;
        Thu, 30 Nov 2023 13:50:10 -0800 (PST)
Received: from imac.fritz.box ([2a02:8010:60a0:0:4842:bce4:1c44:6271])
        by smtp.gmail.com with ESMTPSA id dd10-20020a0560001e8a00b0032fbe5b1e45sm2519237wrb.61.2023.11.30.13.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 13:50:10 -0800 (PST)
From: Donald Hunter <donald.hunter@gmail.com>
To: netdev@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Jacob Keller <jacob.e.keller@intel.com>
Cc: donald.hunter@redhat.com,
	Donald Hunter <donald.hunter@gmail.com>
Subject: [PATCH net-next v1 2/6] doc/netlink: Add sub-message support to netlink-raw
Date: Thu, 30 Nov 2023 21:49:54 +0000
Message-ID: <20231130214959.27377-3-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231130214959.27377-1-donald.hunter@gmail.com>
References: <20231130214959.27377-1-donald.hunter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a 'sub-message' attribute type with a selector that supports
polymorphic attribute formats for raw netlink families like tc.

A sub-message attribute uses the value of another attribute as a
selector key to choose the right sub-message format. For example if the
following attribute has already been decoded:

  { "kind": "gre" }

and we encounter the following attribute spec:

  -
    name: data
    type: sub-message
    sub-message: linkinfo-data-msg
    selector: kind

Then we look for a sub-message definition called 'linkinfo-data-msg' and
use the value of the 'kind' attribute i.e. 'gre' as the key to choose
the correct format for the sub-message:

  sub-messages:
    name: linkinfo-data-msg
    formats:
      -
        value: bridge
        attribute-set: linkinfo-bridge-attrs
      -
        value: gre
        attribute-set: linkinfo-gre-attrs
      -
        value: geneve
        attribute-set: linkinfo-geneve-attrs

This would decode the attribute value as a sub-message with the
attribute-set called 'linkinfo-gre-attrs' as the attribute space.

A sub-message can have an optional 'fixed-header' followed by zero or
more attributes from an attribute-set. For example the following
'tc-options-msg' sub-message defines message formats that use a mixture
of fixed-header, attribute-set or both together:

  sub-messages:
    -
      name: tc-options-msg
      formats:
        -
          value: bfifo
          fixed-header: tc-fifo-qopt
        -
          value: cake
          attribute-set: tc-cake-attrs
        -
          value: netem
          fixed-header: tc-netem-qopt
          attribute-set: tc-netem-attrs

Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
---
 Documentation/netlink/netlink-raw.yaml | 51 +++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/Documentation/netlink/netlink-raw.yaml b/Documentation/netlink/netlink-raw.yaml
index ad5395040765..26203282422f 100644
--- a/Documentation/netlink/netlink-raw.yaml
+++ b/Documentation/netlink/netlink-raw.yaml
@@ -202,7 +202,8 @@ properties:
                 description: The netlink attribute type
                 enum: [ unused, pad, flag, binary, bitfield32,
                         u8, u16, u32, u64, s8, s16, s32, s64,
-                        string, nest, array-nest, nest-type-value ]
+                        string, nest, array-nest, nest-type-value,
+                        sub-message ]
               doc:
                 description: Documentation of the attribute.
                 type: string
@@ -261,6 +262,17 @@ properties:
                 description: Name of the struct type used for the attribute.
                 type: string
               # End genetlink-legacy
+              # Start netlink-raw
+              sub-message:
+                description:
+                  Name of the sub-message definition to use for the attribute.
+                type: string
+              selector:
+                description:
+                  Name of the attribute to use for dynamic selection of sub-message
+                  format specifier.
+                type: string
+              # End netlink-raw
 
       # Make sure name-prefix does not appear in subsets (subsets inherit naming)
       dependencies:
@@ -283,6 +295,43 @@ properties:
             items:
               required: [ type ]
 
+  # Start netlink-raw
+  sub-messages:
+    description: Definition of sub message attributes
+    type: array
+    items:
+      type: object
+      additionalProperties: False
+      required: [ name, formats ]
+      properties:
+        name:
+          description: Name of the sub-message definition
+          type: string
+        formats:
+          description: Dynamically selected format specifiers
+          type: array
+          items:
+            type: object
+            additionalProperties: False
+            required: [ value ]
+            properties:
+              value:
+                description:
+                  Value to match for dynamic selection of sub-message format
+                  specifier.
+                type: string
+              fixed-header:
+                description:
+                  Name of the struct definition to use as the fixed header
+                  for the sub message.
+                type: string
+              attribute-set:
+                description:
+                  Name of the attribute space from which to resolve attributes
+                  in the sub message.
+                type: string
+  # End netlink-raw
+
   operations:
     description: Operations supported by the protocol.
     type: object
-- 
2.42.0


