Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50F294558B8
	for <lists+linux-doc@lfdr.de>; Thu, 18 Nov 2021 11:11:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245535AbhKRKOY (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 18 Nov 2021 05:14:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245421AbhKRKNI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Nov 2021 05:13:08 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72A22C061200
        for <linux-doc@vger.kernel.org>; Thu, 18 Nov 2021 02:10:08 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id i12so4765537wmq.4
        for <linux-doc@vger.kernel.org>; Thu, 18 Nov 2021 02:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x3IEUZRhjbYTq3pkFmizfm4neoX81XVx2vEzIU02Q3k=;
        b=oP1DqeytxmZkGKtLd/xGA9nOPzkVMcUvXbsdxYjlXowDSMRTTSJCEHZfNp/1klKX1K
         4yBiyincygCMsK0e+MtlvKFmvNtlhAWvTZpByxKsNG/ktNqKesMGaAY0Xlhk/I5n2wu0
         oYvFWzGJAL8WcxOL8uJx3ud7CyMK0BIn07ldxqlD6QHOVZPDkVcc3xdf4sgrVvLcxiIL
         gdZ6obEQ3Hpr2xWYrA+yRoA8KufxZw3lop8B84gEWZCpEzo7u2ujEhGyCWOslkaLq2Qs
         y4hXuCEV2M2LXWXbLg3/nNHjjwQzzbXebw3CMQpeM9QrIisSOQt33NRSPNDaHIzqZN05
         /E6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x3IEUZRhjbYTq3pkFmizfm4neoX81XVx2vEzIU02Q3k=;
        b=l9AQxdD8NMv3lFf+6rk83VpiBXG5/UUl95pjaQ9N2guOwL+qRDifKx5cJcmIL2oll4
         VynNTwY8iO61J3d27i85VHktJQlR7EJbAYrZGjK0Baxp5wUgRE7Wak8uY2D7QmqK2/IM
         IhaolSEhBPJB7ARkNxf6JelIU6VnaPyfBvlq6/lVBroDqB7J5dcvVMNl4N2TQC65bJxI
         5B8WwdPE8AG02nnxIRdohXR2dxuZZtgrMx7KhwgI10mDGo/B1NvrQXQSF/z9eb3RfKfB
         tSadlcyMXWSylxcCYtzM6Zpo7T6ILi64JbRI8HrMRkZxH9dUFK7sFJdRtUHsGLneWSxj
         PlEQ==
X-Gm-Message-State: AOAM530+P1vBRnyey4ZqCCkCk6jB4w/v69/0CZpK9B84tynyBOtOG4Hu
        Oz8zprHYSn0Pn6SoR1aMvC7kKA==
X-Google-Smtp-Source: ABdhPJyUQ0azpc9/vV01uM0ChDtP2P8tkuwwB2JaSxcvaCImTHNi8cCg2zVeiKFoh6zTUFs3KNv6nw==
X-Received: by 2002:a05:600c:1d0e:: with SMTP id l14mr8210388wms.64.1637230206900;
        Thu, 18 Nov 2021 02:10:06 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id z15sm2525846wrr.65.2021.11.18.02.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 02:10:06 -0800 (PST)
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc:     Daniel Thompson <daniel.thompson@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@linaro.org
Subject: [PATCH 1/2] Documentation: dmaengine: Add a description of what dmatest does
Date:   Thu, 18 Nov 2021 10:09:51 +0000
Message-Id: <20211118100952.27268-2-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211118100952.27268-1-daniel.thompson@linaro.org>
References: <20211118100952.27268-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Currently it can difficult to determine what dmatest does without
reading the source code. Let's add a description.

The description is taken mostly from the patch header of
commit 4a776f0aa922 ("dmatest: Simple DMA memcpy test client").
It has been edited and updated slightly. Nevertheless the new text was
largely written by Haarvard Skinnemoen and was copied from another
patch, already committed to the kernel, which has Haarvard's SoB:
attached to it.

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 Documentation/driver-api/dmaengine/dmatest.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/driver-api/dmaengine/dmatest.rst b/Documentation/driver-api/dmaengine/dmatest.rst
index ee268d445d38..529cc2cbbb1b 100644
--- a/Documentation/driver-api/dmaengine/dmatest.rst
+++ b/Documentation/driver-api/dmaengine/dmatest.rst
@@ -6,6 +6,16 @@ Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 
 This small document introduces how to test DMA drivers using dmatest module.
 
+The dmatest module tests DMA memcpy, memset, XOR and RAID6 P+Q operations using
+various lengths and various offsets into the source and destination buffers. It
+will initialize both buffers with a repeatable pattern and verify that the DMA
+engine copies the requested region and nothing more. It will also verify that
+the bytes aren't swapped around, and that the source buffer isn't modified.
+
+The dmatest module can be configured to test a specific channel. It can also
+test multiple channels at the same time, and it can start multiple threads
+competing for the same channel.
+
 .. note::
   The test suite works only on the channels that have at least one
   capability of the following: DMA_MEMCPY (memory-to-memory), DMA_MEMSET
-- 
2.33.0

