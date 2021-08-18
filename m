Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05E6F3F07A0
	for <lists+linux-doc@lfdr.de>; Wed, 18 Aug 2021 17:14:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239819AbhHRPO3 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 18 Aug 2021 11:14:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239746AbhHRPO2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Aug 2021 11:14:28 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 080ABC06179A
        for <linux-doc@vger.kernel.org>; Wed, 18 Aug 2021 08:13:54 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id w24so1847185wmi.5
        for <linux-doc@vger.kernel.org>; Wed, 18 Aug 2021 08:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nbMWlithtc3sWWU5KtkiCkqIKx2WyKuGJ2d75kfkDHg=;
        b=iPW/OHiA0R+DD07D59x4R67evSpX775MqwnnwhDmKH0Rj8MGJtnYtqbDAat2iQ5Pg0
         ufww3qxEhh1jfOzdSFlExrha/KqIGiZusIW18AwTyBve+4z6NC11esVI3oJrNckU4/yH
         2PtwdmvPqM2YoglDRtnwoTnxJEzyuMuCGhukjqVZKVq8n9n9wHCdVyi/IF4TVedfaKC1
         KeGet4oNy+Cb3Obp+DCj+fp2pWSbZ7SmfMtVU8VYZIJGk8nK/a4XRW/ugpifwDwOeYZE
         M9dlgnyAwJL/xlfm3TaaGWBIBSExvF7Nyi/hbXxi/GoqvecFfrGU2Je/RStaPw16JLAR
         Er1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nbMWlithtc3sWWU5KtkiCkqIKx2WyKuGJ2d75kfkDHg=;
        b=GNGbRUF0qoMmQ/VJqIkst2goVaGw3nJ5kyYHiBzRsRBvAU5y+YDbUgoOuULTpM0TYK
         LPWVXqIXjYrKJTUCY+whkrG4zb87nh8VUa4yNouHZ8hSZagi6j95bhrvwTKVYN4R6ePp
         MqAew5C44PbuBVXE9xGyQ4n9jtCzXrHZGYzbFH2XEAqXOF5UmdZ/0mpEr1tykShUD5iC
         IXM9uzzMaXsZYQpDxRGldf8hfzYtp7dMz2QIHpq9VB96L2b2bucO+vSPbvL0xb2gR3/a
         0/6P9ZSmzMfVcTW4accyJOHfh3pUf8hctOgtJ46ufGSooiJ3obl8JpcIZUnmDA0Xv3MK
         5LJw==
X-Gm-Message-State: AOAM531AziObxmPtyflKeCpc49UqdZxsUiA/ly4Xwr1bCUPJeuQ1PfvO
        s0vzNRJqhYo9OLdWIXZhDNtViA==
X-Google-Smtp-Source: ABdhPJyk4XXcjDZ7LTzwBAp9AanY2gQP1Y3AVdN1Mqr48CV2jUlsxvWKpvaznk2oTpBnBwmdzw9MXw==
X-Received: by 2002:a05:600c:b51:: with SMTP id k17mr9039289wmr.149.1629299632593;
        Wed, 18 Aug 2021 08:13:52 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id l21sm101829wmh.31.2021.08.18.08.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 08:13:52 -0700 (PDT)
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc:     Daniel Thompson <daniel.thompson@linaro.org>,
        dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@linaro.org,
        Haavard Skinnemoen <hskinnemoen@atmel.com>
Subject: [PATCH 1/2] Documentation: dmaengine: Add a description of what dmatest does
Date:   Wed, 18 Aug 2021 16:13:14 +0100
Message-Id: <20210818151315.9505-2-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818151315.9505-1-daniel.thompson@linaro.org>
References: <20210818151315.9505-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Currently it can difficult to determine what dmatest does without
reading the source code. Let's add a description.

The description is taken mostly from the patch header of
commit 4a776f0aa922 ("dmatest: Simple DMA memcpy test client")
although it has been edited and updated slightly.

Signed-off-by: Haavard Skinnemoen <hskinnemoen@atmel.com>
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
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
2.30.2

